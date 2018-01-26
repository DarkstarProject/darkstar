-----------------------------------
-- Area:
--  MOB: Long-Armed_Chariot
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(MOON_CHARIOTEER);
end;