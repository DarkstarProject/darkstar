-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Yagudo_Theologist
-----------------------------------
require("scripts/zones/Castle_Oztroja/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,MOO_OUZI_THE_SWIFTBLADE_PH,5,math.random(3600,10800)); -- 1 to 3 hours
end;
