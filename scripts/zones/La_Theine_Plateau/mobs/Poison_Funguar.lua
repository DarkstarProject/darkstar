-----------------------------------
-- Area: La Theine Plateau
--  MOB: Poison Funguar
-----------------------------------
require("scripts/zones/La_Theine_Plateau/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,71,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,TUMBLING_TRUFFLE_PH,5,math.random(3600,28800)); -- 1 to 8 hours
end;
