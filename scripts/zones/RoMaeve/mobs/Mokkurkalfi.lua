-----------------------------------
-- Area: RoMaeve
--  MOB: Mokkurkalfi
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    if (player:getCurrentMission(BASTOK) == THE_FINAL_IMAGE and player:getVar("MissionStatus") == 1) then
        player:setVar("Mission7-1MobKilled",1);
    end

end;
