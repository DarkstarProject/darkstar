-----------------------------------
-- Area: Temenos E T
--  Mob: Ice Elemental
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
        [ID.mob.TEMENOS_E_MOB[2]] = function()
            battlefield:setLocalVar("cofferMask", bit.bor(cofferMask, math.pow(2, 0)))
            GetNPCByID(ID.npc.COFFER_OFFSET+174):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+174):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[2]+1] = function()
            battlefield:setLocalVar("cofferMask", bit.bor(cofferMask, math.pow(2, 1)))
            GetNPCByID(ID.npc.COFFER_OFFSET+216):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+216):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[2]+2] = function()
            if random == 1 then
                GetNPCByID(ID.npc.COFFER_OFFSET+321):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.COFFER_OFFSET+321):setStatus(dsp.status.NORMAL)
            else
                battlefield:setLocalVar("cofferMask", bit.bor(cofferMask, math.pow(2, 2)))
                GetNPCByID(ID.npc.COFFER_OFFSET+45):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.COFFER_OFFSET+45):setStatus(dsp.status.NORMAL)
            end
        end,
        [ID.mob.TEMENOS_E_MOB[2]+3] = function()
            if random == 1 then
                battlefield:setLocalVar("cofferMask", bit.bor(cofferMask, math.pow(2, 2)))
                GetNPCByID(ID.npc.COFFER_OFFSET+45):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.COFFER_OFFSET+45):setStatus(dsp.status.NORMAL)
            else
                GetNPCByID(ID.npc.COFFER_OFFSET+321):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.COFFER_OFFSET+321):setStatus(dsp.status.NORMAL)
            end
        end,
        [ID.mob.TEMENOS_C_MOB[2]+4] = function()
            GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(dsp.mod.ICEDEF, -128)
            if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+5):isAlive() then
                DespawnMob(ID.mob.TEMENOS_C_MOB[2]+5)
                SpawnMob(ID.mob.TEMENOS_C_MOB[2]+11)
            end
        end,
     }
end