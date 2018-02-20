-----------------------------------
-- Area: Beadeaux (254)
--  Mob: Brass Quadav
-- Note: PH for Bi'Gho Headtaker
-----------------------------------
require("scripts/zones/Beadeaux/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,BI_GHO_HEADTAKER_PH,10,math.random(3600,10800)); -- 1 to 3 hours
end;
