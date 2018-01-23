-----------------------------------
-- Area: Riverne-Site_A01
--  MOB: Ouryu
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(OURYU_OVERWHELMER);
end;