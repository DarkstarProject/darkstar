-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Dervo's Ghost
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 180);
end;

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(BASTOK) == ENTER_THE_TALEKEEPER and player:getVar("MissionStatus") == 2) then
        player:setVar("MissionStatus",3);
    end
end;
