-----------------------------------
-- Area: Temenos E T
--  Mob: Thunder Elemental
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID()
    local mobX = mob:getXPos()
    local mobY = mob:getYPos()
    local mobZ = mob:getZPos()
    local battlefield = player:getBattlefield()
    local cofferMask = battlefield:getLocalVar("cofferMask")
    local random = battlefield:getLocalVar("random")

    switch (mobID): caseof {
        [ID.mob.TEMENOS_E_MOB[5]] = function()
            battlefield:setLocalVar("cofferMask", bit.bor(cofferMask, math.pow(2, 0)))
            GetNPCByID(ID.npc.COFFER_OFFSET+183):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+183):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[5]+1] = function()
            battlefield:setLocalVar("cofferMask", bit.bor(cofferMask, math.pow(2, 1)))
            GetNPCByID(ID.npc.COFFER_OFFSET+261):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+261):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[5]+2] = function()
            if random == 1 then
                GetNPCByID(ID.npc.COFFER_OFFSET+393):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.COFFER_OFFSET+393):setStatus(dsp.status.NORMAL)
            else
                battlefield:setLocalVar("cofferMask", bit.bor(cofferMask, math.pow(2, 2)))
                GetNPCByID(ID.npc.COFFER_OFFSET+68):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.COFFER_OFFSET+68):setStatus(dsp.status.NORMAL)
            end
        end,
        [ID.mob.TEMENOS_E_MOB[5]+3] = function()
            if random == 1 then
                battlefield:setLocalVar("cofferMask", bit.bor(cofferMask, math.pow(2, 2)))
                GetNPCByID(ID.npc.COFFER_OFFSET+68):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.COFFER_OFFSET+68):setStatus(dsp.status.NORMAL)
            else
                GetNPCByID(ID.npc.COFFER_OFFSET+393):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.COFFER_OFFSET+393):setStatus(dsp.status.NORMAL)
            end
        end,
        [ID.mob.TEMENOS_C_MOB[2]+7] = function()
            GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(dsp.mod.THUNDERDEF, -128)
            if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+8):isAlive() then
                DespawnMob(ID.mob.TEMENOS_C_MOB[2]+8)
                SpawnMob(ID.mob.TEMENOS_C_MOB[2]+14)
            end
        end,
    }
end