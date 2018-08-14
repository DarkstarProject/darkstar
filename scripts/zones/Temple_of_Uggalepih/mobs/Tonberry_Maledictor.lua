-----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Tonberry Maledictor
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}
require("scripts/globals/groundsofvalor");

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,790,1);
    checkGoVregime(player,mob,791,1);
    checkGoVregime(player,mob,792,1);
    checkGoVregime(player,mob,793,1);
    checkGoVregime(player,mob,794,1);
    checkGoVregime(player,mob,795,1);
end;
