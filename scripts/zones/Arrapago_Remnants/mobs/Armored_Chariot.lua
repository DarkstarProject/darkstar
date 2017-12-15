-----------------------------------
-- Area:
--  MOB: Armored_Chariot
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(SUN_CHARIOTEER);
end;