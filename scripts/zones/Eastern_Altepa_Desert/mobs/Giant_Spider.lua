-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Giant Spider
-- Note: PH for Dune Widow
-----------------------------------
require("scripts/zones/Eastern_Altepa_Desert/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,109,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,DUNE_WIDOW_PH,5,math.random(3600,18000)); -- 1 to 5 hours
end;
