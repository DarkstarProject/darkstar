-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Desert Dhalmel
-- Note: Place holder for Celphie
-----------------------------------
require("scripts/zones/Western_Altepa_Desert/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,135,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,CELPHIE_PH,5,math.random(7200,28800)); -- 2 to 8 hours
end;
