-----------------------------------
-- Area: Beadeaux (254)
--  Mob: Emerald Quadav
-- Note: PH for Ga'Bhu Unvanquished
-----------------------------------
require("scripts/zones/Beadeaux/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,GA_BHU_UNVANQUISHED_PH,10,3600); -- 1 hour
end;
