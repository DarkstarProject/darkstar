-----------------------------------
-- Area: Apollyon NW
--  Mob: Gorynich
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local battlefield = player:getBattlefield()
        local randomMob = battlefield:getLocalVar("randomMob")
        if mobID == randomMob then
            local players = battlefield:getPlayers()
            for i, member in pairs(players) do
                member:messageSpecial(ID.text.GATE_OPEN)
                member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            end
            battlefield:setLocalVar("portalF4", 1)
        end
    end
end