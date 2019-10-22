-----------------------------------
-- Area: Temenos E T
--  Mob: Earth Elemental
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
        [ID.mob.TEMENOS_E_MOB[4]] = function ()
            GetNPCByID(ID.npc.COFFER_OFFSET+182):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+182):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[3]+1] = function ()
            GetNPCByID(ID.npc.COFFER_OFFSET+236):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+236):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[3]+2] = function ()
            GetNPCByID(ID.npc.COFFER_OFFSET+360):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+360):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[3]+3] = function ()
            GetNPCByID(ID.npc.COFFER_OFFSET+47):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+47):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_C_MOB[2]+6] = function ()
            if not limbus.isMobDead(ID.mob.TEMENOS_C_MOB[2]+7) then
                DespawnMob(ID.mob.TEMENOS_C_MOB[2]+7)
                SpawnMob(ID.mob.TEMENOS_C_MOB[2]+13)
            end
        end,
    }
end