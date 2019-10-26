-----------------------------------
-- Area: Temenos E T
--  Mob: Water Elemental
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
        [ID.mob.TEMENOS_E_MOB[6]] = function()
            battlefield:setLocalVar("cofferMask", bit.bor(cofferMask, math.pow(2, 0)))
            GetNPCByID(ID.npc.COFFER_OFFSET+202):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+202):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[6]+1] = function()
            battlefield:setLocalVar("cofferMask", bit.bor(cofferMask, math.pow(2, 1)))
            GetNPCByID(ID.npc.COFFER_OFFSET+190):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+190):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[6]+2] = function()
            if random == 1 then
                GetNPCByID(ID.npc.COFFER_OFFSET+277):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.COFFER_OFFSET+277):setStatus(dsp.status.NORMAL)
            else
                battlefield:setLocalVar("cofferMask", bit.bor(cofferMask, math.pow(2, 2)))
                GetNPCByID(ID.npc.COFFER_OFFSET+69):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.COFFER_OFFSET+69):setStatus(dsp.status.NORMAL)
            end
        end,
        [ID.mob.TEMENOS_E_MOB[6]+3] = function()
            if random == 1 then
                battlefield:setLocalVar("cofferMask", bit.bor(cofferMask, math.pow(2, 2)))
                GetNPCByID(ID.npc.COFFER_OFFSET+69):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.COFFER_OFFSET+69):setStatus(dsp.status.NORMAL)
            else
                GetNPCByID(ID.npc.COFFER_OFFSET+277):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.COFFER_OFFSET+277):setStatus(dsp.status.NORMAL)
            end
        end,
        [ID.mob.TEMENOS_C_MOB[2]+8] = function()
            GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(dsp.mod.WATERDEF, -128)
            if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+3):isAlive() then
                DespawnMob(ID.mob.TEMENOS_C_MOB[2]+3)
                SpawnMob(ID.mob.TEMENOS_C_MOB[2]+9)
            end
        end,
    }
end