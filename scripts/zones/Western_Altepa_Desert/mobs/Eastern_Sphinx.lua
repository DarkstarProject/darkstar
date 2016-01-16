-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Eastern Sphinx
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)

    if (ally:getCurrentMission(BASTOK) == RETURN_OF_THE_TALEKEEPER and ally:getVar("MissionStatus") == 2) then
        ally:setVar("Mission6-1MobKilled",1);
    end

end;