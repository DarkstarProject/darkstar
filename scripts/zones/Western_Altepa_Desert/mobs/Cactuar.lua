-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Cactuar
-- Note: Place holder for Cactuar_Cantautor
-----------------------------------
require("scripts/zones/Western_Altepa_Desert/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,136,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,CACTUAR_CANTAUTOR_PH,5,math.random(3600,43200)); -- 1 to 12 hours
end;
