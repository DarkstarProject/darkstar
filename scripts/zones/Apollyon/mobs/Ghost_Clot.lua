-----------------------------------
-- Area: Apollyon SE
--  Mob: Ghost Clot
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local battlefield = player:getBattlefield()
        local players = battlefield:getPlayers()
        for i, member in pairs(players) do
            member:messageSpecial(ID.text.GATE_OPEN)
            member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
        end
    end
end