-----------------------------------
-- Area: Apollyon NE
--  Mob: Apollyon Sweeper
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local battlefield = player:getBattlefield()
        local portalTriggerF3 = battlefield:getLocalVar("portalTriggerF3")
        if portalTriggerF3 == mobID then
            local players = battlefield:getPlayers()
            for i, member in pairs(players) do
                member:messageSpecial(ID.text.GATE_OPEN)
                member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            end
            battlefield:setLocalVar("randomF4", ID.mob.APOLLYON_NE_MOB[4]+math.random(0,2))
            battlefield:setLocalVar("portalF3", 1)
        end
    end
end