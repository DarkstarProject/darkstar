-----------------------------------
-- Area: Promyvion vahzl
--  MOB: Ponderer
-----------------------------------


require("scripts/globals/missions");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==5) then
        player:setVar("PromathiaStatus",6);
    end
end;