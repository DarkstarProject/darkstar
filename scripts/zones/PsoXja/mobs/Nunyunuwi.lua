-----------------------------------
-- Area: Pso'xja
--  MOB: Nunyunuwi
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(COP) == THE_ENDURING_TUMULT_OF_WAR and player:getVar("PromathiaStatus")==3) then
        player:setVar("PromathiaStatus",4);
    end
end;