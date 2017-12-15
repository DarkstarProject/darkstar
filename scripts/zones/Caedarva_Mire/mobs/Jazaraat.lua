-----------------------------------
-- Area: Caedarva Mire
--  MOB: Jazaraat
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(TOAU) == LOST_KINGDOM) then
        player:setVar("AhtUrganStatus", 2);
    end
end;
