-----------------------------------
-- Area:
--  MOB: Battleclad Chariot
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(STAR_CHARIOTEER);
end;