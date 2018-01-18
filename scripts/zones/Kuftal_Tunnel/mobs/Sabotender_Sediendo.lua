-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Sabotender Sediendo
-- Note: Place Holder for Sabotender Mariachi
-----------------------------------
require("scripts/zones/Kuftal_Tunnel/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,738,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,SABOTENDER_MARIACHI_PH,5,math.random(10800,28800)); -- 3 to 8 hours
end;
