-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Eastern Sphinx
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    if (player:getCurrentMission(BASTOK) == RETURN_OF_THE_TALEKEEPER and player:getVar("MissionStatus") == 2) then
        player:setVar("Mission6-1MobKilled",1);
    end

end;