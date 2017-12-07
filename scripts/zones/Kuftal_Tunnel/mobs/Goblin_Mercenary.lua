-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Goblin Mercenary
-- Note: Place Holder for Bloodthirster Madkix
-----------------------------------
require("scripts/zones/Kuftal_Tunnel/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,740,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,BLOODTHIRSTER_MADKIX_PH,5,math.random(7200,28800)); -- 2 to 8 hours
end;
