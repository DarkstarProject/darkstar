-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Sand Lizard
-- Note: Place Holder for Amemet
-----------------------------------
require("scripts/zones/Kuftal_Tunnel/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,735,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,AMEMET_PH,5,math.random(7200,43200)); -- 2 to 12 hours
end;
