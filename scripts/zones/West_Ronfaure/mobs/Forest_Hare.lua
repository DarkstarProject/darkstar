-----------------------------------
-- Area: West Ronfaure
--  MOB: Forest Hare
-----------------------------------
require("scripts/zones/West_Ronfaure/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,2,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,JAGGEDY_EARED_JACK_PH,5,math.random(3000,21600)); -- 50 minutes to 6 hours
end;
