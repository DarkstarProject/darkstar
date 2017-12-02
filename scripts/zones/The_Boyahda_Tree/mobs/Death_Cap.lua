-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Death Cap
-----------------------------------
require("scripts/zones/The_Boyahda_Tree/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,719,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ELLYLLON_PH,10,math.random(7200,10800)); -- 2 to 3 hours
end;
