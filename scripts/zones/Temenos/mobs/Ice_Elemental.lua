-----------------------------------
-- Area: Temenos E T
--  Mob: Ice Elemental
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
end

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID()
    local mobX = mob:getXPos()
    local mobY = mob:getYPos()
    local mobZ = mob:getZPos()
    switch (mobID): caseof {
         -- 100 a 106 inclut (Temenos -Northern Tower )
        [ID.mob.TEMENOS_E_MOB[2]] = function()
            GetNPCByID(ID.npc.COFFER_OFFSET+174):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+174):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[2]+1] = function()
            GetNPCByID(ID.npc.COFFER_OFFSET+216):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+216):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[2]+2] = function()
            GetNPCByID(ID.npc.COFFER_OFFSET+321):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+321):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[2]+3] = function()
            GetNPCByID(ID.npc.COFFER_OFFSET+45):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+45):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_C_MOB[2]+4] = function()
            if not limbus.isMobDead(ID.mob.TEMENOS_C_MOB[2]+5) then -- wind
                DespawnMob(ID.mob.TEMENOS_C_MOB[2]+5)
                SpawnMob(ID.mob.TEMENOS_C_MOB[2]+11)
            end
        end,
     }
end