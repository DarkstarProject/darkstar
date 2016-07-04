-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Dervo's Ghost
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    if (player:getCurrentMission(BASTOK) == ENTER_THE_TALEKEEPER and player:getVar("MissionStatus") == 2) then
        player:setVar("MissionStatus",3);
    end

end;
