----------------------------------
-- Area: Gustav Tunnel
--  MOB: Goblin Reaper
-- Note: Place holder Goblinsavior Heronox
-----------------------------------
require("scripts/zones/Gustav_Tunnel/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,764,3);
    checkGoVregime(player,mob,765,3);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,GOBLINSAVIOR_HERONOX_PH,5,math.random(10800,18000)); -- 3 to 5 hours
end;
