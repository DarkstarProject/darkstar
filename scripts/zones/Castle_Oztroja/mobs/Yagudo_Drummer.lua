-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Yagudo_Drummer
-----------------------------------
require("scripts/zones/Castle_Oztroja/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,MEE_DEGGI_THE_PUNISHER_PH,5,math.random(3600,10800)); -- 1 to 3 hours
end;
