-----------------------------------
-- Area: Den of Rancor
--  MOB: Tonberry Trailer
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}
require("scripts/globals/groundsofvalor");

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,798,1);
    checkGoVregime(player,mob,799,2);
    checkGoVregime(player,mob,800,2);
end;
