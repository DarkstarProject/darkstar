-----------------------------------
-- Area:
--  MOB: Lord Ruthven
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.RUTHVEN_ENTOMBER);
end;