-----------------------------------
-- Area: Temenos E T
--  Mob: Dark Elemental
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
        [ID.mob.TEMENOS_E_MOB[7]] = function ()
            GetNPCByID(ID.npc.COFFER_OFFSET+70):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+70):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_E_MOB[7]+1] = function ()
            GetNPCByID(ID.npc.COFFER_OFFSET+123):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+123):setStatus(dsp.status.NORMAL)
        end,
    }
end