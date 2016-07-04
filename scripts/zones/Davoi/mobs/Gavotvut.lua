-----------------------------------
-- Area: Davoi
--  MOB: Gavotvut
-- Involved in Quest: The Doorman
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    if (player:getVar("theDoormanMyMob") == 1) then
        player:setVar("theDoormanKilledNM",player:getVar("theDoormanKilledNM") + 1);
    end

end;