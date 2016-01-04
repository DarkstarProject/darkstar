-----------------------------------
-- Area: Ghelsba Outpost
--  MOB: Warchief Vatgit
-- Involved in Mission 2-3
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer,ally)

    if (ally:getCurrentMission(ally:getNation()) == 6) then
        if (ally:getVar("MissionStatus") == 4) then
            ally:setVar("MissionStatus",5);
        end
    end

    ally:addTitle(WARCHIEF_WRECKER);

end;