-----------------------------------
-- Area: Giddeus (145)
--  MOB: Yagudo_Persecutor
-----------------------------------
require("scripts/zones/Giddeus/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,JUU_DUZU_THE_WHIRLWIND_PH,5,math.random(3600,7200)); -- 1 to 2 hours
end;
