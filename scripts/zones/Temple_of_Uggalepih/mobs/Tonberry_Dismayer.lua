-----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Tonberry Dismayer
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}
require("scripts/globals/groundsofvalor");
require("scripts/zones/Temple_of_Uggalepih/MobIDs");

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,790,1);
    checkGoVregime(player,mob,791,1);
    checkGoVregime(player,mob,792,1);
    checkGoVregime(player,mob,793,1);
    checkGoVregime(player,mob,794,1);
    checkGoVregime(player,mob,795,1);
    phOnDespawn(mob,TONBERRY_KINQ_PH,10,21600); -- 6 hours, 10% pop chance
end;