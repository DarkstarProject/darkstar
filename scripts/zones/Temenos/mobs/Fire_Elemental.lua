-----------------------------------
-- Area: Temenos E T
--  Mob: Fire Elemental
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
        [ID.mob.TEMENOS_E_MOB[1]] = function()
            GetNPCByID(ID.npc.COFFER_OFFSET+173):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+173):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[1]+1] = function()
            GetNPCByID(ID.npc.COFFER_OFFSET+215):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+215):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[1]+2] = function()
            GetNPCByID(ID.npc.COFFER_OFFSET+284):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+284):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[1]+3] = function()
            GetNPCByID(ID.npc.COFFER_OFFSET+40):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+40):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_C_MOB[2]+3] = function()
            if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+4):isAlive() then -- ice
                DespawnMob(ID.mob.TEMENOS_C_MOB[2]+4)
                SpawnMob(ID.mob.TEMENOS_C_MOB[2]+10)
            end
        end,
    }
end