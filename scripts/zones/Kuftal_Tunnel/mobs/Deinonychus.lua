-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Deinonychus
-- Note: Place Holder for Yowie
-----------------------------------
require("scripts/zones/Kuftal_Tunnel/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,740,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,YOWIE_PH,5,math.random(7200,28800)); -- 2 to 8 hours
end;
