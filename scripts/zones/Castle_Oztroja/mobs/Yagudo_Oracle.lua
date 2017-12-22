-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Yagudo_Oracle
-----------------------------------
require("scripts/zones/Castle_Oztroja/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,QUU_DOMI_THE_GALLANT_PH,5,math.random(3600,10800)); -- 1 to 3 hours
end;
