-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Sabotender Enamorado
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    local currentMission = ally:getCurrentMission(SANDORIA);
    local MissionStatus = ally:getVar("MissionStatus");

    if (currentMission == LEAUTE_S_LAST_WISHES and MissionStatus == 2) then
        ally:setVar("Mission6-1MobKilled",1);
    end

end;
