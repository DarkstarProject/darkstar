-----------------------------------
-- Area: Rolanberry Fields
--  MOB: Evil Weapon
-- Note: PH for Eldritch Edge
-----------------------------------
require("scripts/zones/Rolanberry_Fields/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ELDRITCH_EDGE_PH,20,math.random(5400,7200)); -- 90 to 120 minutes
end;
