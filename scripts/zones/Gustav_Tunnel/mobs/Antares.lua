----------------------------------
-- Area: Gustav Tunnel
--  MOB: Antares
-- Note: Place holder Amikiri
-----------------------------------
require("scripts/zones/Gustav_Tunnel/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,768,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,AMIKIRI_PH,5,math.random(25200,32400)); -- 7 to 9 hours
end;
