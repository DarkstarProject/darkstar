-----------------------------------
-- Area: RuAun Gardens
--  MOB: Groundskeeper
-- Note: Place holder Despot
-----------------------------------
require("scripts/zones/RuAun_Gardens/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,143,2);
    checkRegime(player,mob,144,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,DESPOT_PH,5,7200); -- 2 hours
end;
