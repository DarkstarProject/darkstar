-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Dervo's Ghost
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)

    if (ally:getCurrentMission(BASTOK) == ENTER_THE_TALEKEEPER and ally:getVar("MissionStatus") == 2) then
        ally:setVar("MissionStatus",3);
    end

end;
