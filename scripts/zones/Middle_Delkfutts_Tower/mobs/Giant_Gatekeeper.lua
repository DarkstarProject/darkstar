-----------------------------------
-- Area: Middle Delkfutt's Tower
--  MOB: Giant Gatekeeper
-- Note: PH for Rhoitos and Polybotes
-----------------------------------
require("scripts/zones/Middle_Delkfutts_Tower/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,783,1);
    checkGoVregime(player,mob,784,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,RHOITOS_PH,5,math.random(7200,14400)); -- 2 to 4 hours (could not find info, so using Ogygos' cooldown)
    phOnDespawn(mob,POLYBOTES_PH,5,math.random(7200,14400)); -- 2 to 4 hours (could not find info, so using Ogygos' cooldown)
end;
