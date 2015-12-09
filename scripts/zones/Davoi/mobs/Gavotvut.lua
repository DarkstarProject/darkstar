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

function onMobDeath(mob, killer, ally)

    if (ally:getVar("theDoormanMyMob") == 1) then
        ally:setVar("theDoormanKilledNM",ally:getVar("theDoormanKilledNM") + 1);
    end

end;