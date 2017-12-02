-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Greater Cockatrice
-- Note: Place Holder for Pelican
-----------------------------------
require("scripts/zones/Kuftal_Tunnel/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,741,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,PELICAN_PH,5,math.random(10800,43200)); -- 4 to 12 hours
end;
