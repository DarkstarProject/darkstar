-----------------------------------
-- Area: Apollyon NW
--  Mob: Bardha
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local battlefield = player:getBattlefield()
        local randomF1 = battlefield:getLocalVar("randomF1")
        if mobID == randomF1 then
            battlefield:setLocalVar("randomF2", ID.mob.APOLLYON_NW_MOB[2]+math.random(1,8))
            dsp.limbus.handleDoors(battlefield, true, ID.npc.APOLLYON_NW_PORTAL[1])
        end
    end
end
