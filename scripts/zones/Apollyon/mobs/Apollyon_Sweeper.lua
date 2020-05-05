-----------------------------------
-- Area: Apollyon NE
--  Mob: Apollyon Sweeper
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local battlefield = player:getBattlefield()
        local portalTriggerF3 = battlefield:getLocalVar("portalTriggerF3")
        if portalTriggerF3 == mobID then
            battlefield:setLocalVar("randomF4", ID.mob.APOLLYON_NE_MOB[4]+math.random(0,2))
            dsp.limbus.handleDoors(battlefield, true, ID.npc.APOLLYON_NE_PORTAL[3])
        end
    end
end