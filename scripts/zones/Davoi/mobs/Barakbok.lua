-----------------------------------
-- Area: Davoi
--  Mob: Barakbok
-- Involved in Quest: The Doorman
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:getCharVar("theDoormanMyMob") == 1) then
        player:addVar("theDoormanKilledNM", 1);
    end
end;