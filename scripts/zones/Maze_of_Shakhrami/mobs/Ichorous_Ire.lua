-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Ichorous_Ire
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(JELLYBANE);
end;