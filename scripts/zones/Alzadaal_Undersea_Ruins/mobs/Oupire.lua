-----------------------------------
-- Area:
--  MOB: Oupire
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(OUPIRE_IMPALER);
end;