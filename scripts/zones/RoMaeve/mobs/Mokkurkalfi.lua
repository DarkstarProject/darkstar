-----------------------------------
-- Area: RoMaeve
--  MOB: Mokkurkalfi
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)

    if (ally:getCurrentMission(BASTOK) == THE_FINAL_IMAGE and ally:getVar("MissionStatus") == 1) then
        ally:setVar("Mission7-1MobKilled",1);
    end

end;
