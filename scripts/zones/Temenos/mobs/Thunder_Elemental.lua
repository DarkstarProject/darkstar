-----------------------------------
-- Area: Temenos E T
--  Mob: Thunder Elemental
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
        [ID.mob.TEMENOS_E_MOB[5]] = function()
            GetNPCByID(ID.npc.COFFER_OFFSET+183):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+183):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[5]+1] = function()
            GetNPCByID(ID.npc.COFFER_OFFSET+261):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+261):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[5]+2] = function()
            GetNPCByID(ID.npc.COFFER_OFFSET+393):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+393):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[5]+3] = function()
            GetNPCByID(ID.npc.COFFER_OFFSET+68):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+68):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_C_MOB[2]+7] = function()
            if not limbus.isMobDead(ID.mob.TEMENOS_C_MOB[2]+8) then
                DespawnMob(ID.mob.TEMENOS_C_MOB[2]+8)
                SpawnMob(ID.mob.TEMENOS_C_MOB[2]+14)
            end
        end,
    }
end