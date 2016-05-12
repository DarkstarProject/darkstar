-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Sabotender Enamorado
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local currentMission = player:getCurrentMission(SANDORIA);
    local MissionStatus = player:getVar("MissionStatus");

    if (currentMission == LEAUTE_S_LAST_WISHES and MissionStatus == 2) then
        player:setVar("Mission6-1MobKilled",1);
    end

end;
