----------------------------------
-- Area: Gustav Tunnel
--  MOB: Goblin Mercenary
-- Note: Place holder Wyvernpoacher Drachlox
-----------------------------------
require("scripts/zones/Gustav_Tunnel/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,764,3);
    checkGoVregime(player,mob,765,3);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,WYVERNPOACHER_DRACHLOX_PH,5,math.random(7200,28800)); -- 2 to 8 hours
end;
