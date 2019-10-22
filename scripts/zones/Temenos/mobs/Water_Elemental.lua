-----------------------------------
-- Area: Temenos E T
--  Mob: Water Elemental
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
        [ID.mob.TEMENOS_E_MOB[6]] = function()
            GetNPCByID(ID.npc.COFFER_OFFSET+277):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+277):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[6]+1] = function()
            GetNPCByID(ID.npc.COFFER_OFFSET+190):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+190):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[6]+2] = function()
            GetNPCByID(ID.npc.COFFER_OFFSET+127):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+127):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[6]+3] = function()
            GetNPCByID(ID.npc.COFFER_OFFSET+69):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+69):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_C_MOB[2]+8] = function()
            if not limbus.isMobDead(ID.mob.TEMENOS_C_MOB[2]+3) then
                DespawnMob(ID.mob.TEMENOS_C_MOB[2]+3)
                SpawnMob(ID.mob.TEMENOS_C_MOB[2]+9)
            end
        end,
    }
end