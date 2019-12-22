-----------------------------------
-- Area: Apollyon NW
--  Mob: Mountain Buffalo
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID()
    if isKiller then
        local battlefield = player:getBattlefield()
        local randomF2 = battlefield:getLocalVar("randomF2")
        if mobID == randomF2 then
            battlefield:setLocalVar("randomF3", ID.mob.APOLLYON_NW_MOB[3]+math.random(1,8))
            dsp.limbus.handleDoors(battlefield, true, ID.npc.APOLLYON_NW_PORTAL[2])
        end
    end
end