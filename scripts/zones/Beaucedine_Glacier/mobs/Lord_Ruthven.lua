-----------------------------------
-- Area: Beaucedine Glacier
--  MOB: Lord Ruthven
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(RUTHVEN_ENTOMBER);
end;