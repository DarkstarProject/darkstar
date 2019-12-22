-----------------------------------
-- Area: Apollyon NW
--  Mob: Apollyon Scavenger
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local battlefield = player:getBattlefield()
        local randomF3 = battlefield:getLocalVar("randomF3")
        if mobID == randomF3 then
            battlefield:setLocalVar("randomF4", ID.mob.APOLLYON_NW_MOB[4]+math.random(1,6))
            dsp.limbus.handleDoors(battlefield, true, ID.npc.APOLLYON_NW_PORTAL[3])
        end
    end
end