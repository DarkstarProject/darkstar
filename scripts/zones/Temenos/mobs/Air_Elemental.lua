-----------------------------------
-- Area: Temenos E T
--  Mob: Air Elemental
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
        [ID.mob.TEMENOS_E_MOB[3]] = function()
            battlefield:setLocalVar("cofferMask", bit.bor(cofferMask, math.pow(2, 0)))
            GetNPCByID(ID.npc.COFFER_OFFSET+181):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+181):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[3]+1] = function()
            battlefield:setLocalVar("cofferMask", bit.bor(cofferMask, math.pow(2, 1)))
            GetNPCByID(ID.npc.COFFER_OFFSET+217):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+217):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[3]+2] = function()
            if random == 1 then
                GetNPCByID(ID.npc.COFFER_OFFSET+348):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.COFFER_OFFSET+348):setStatus(dsp.status.NORMAL)
            else
                battlefield:setLocalVar("cofferMask", bit.bor(cofferMask, math.pow(2, 2)))
                GetNPCByID(ID.npc.COFFER_OFFSET+46):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.COFFER_OFFSET+46):setStatus(dsp.status.NORMAL)
            end
        end,
        [ID.mob.TEMENOS_E_MOB[3]+3] = function()
            if random == 1 then
                battlefield:setLocalVar("cofferMask", bit.bor(cofferMask, math.pow(2, 2)))
                GetNPCByID(ID.npc.COFFER_OFFSET+46):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.COFFER_OFFSET+46):setStatus(dsp.status.NORMAL)
            else
                GetNPCByID(ID.npc.COFFER_OFFSET+348):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.COFFER_OFFSET+348):setStatus(dsp.status.NORMAL)
            end
        end,
        [ID.mob.TEMENOS_C_MOB[2]+5] = function()
            GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(dsp.mod.WINDDEF, -128)
            if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+6):isAlive() then
                DespawnMob(ID.mob.TEMENOS_C_MOB[2]+6)
                SpawnMob(ID.mob.TEMENOS_C_MOB[2]+12)
            end
        end,
    }
end