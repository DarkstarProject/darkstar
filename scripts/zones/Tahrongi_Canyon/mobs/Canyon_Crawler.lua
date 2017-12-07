-----------------------------------
-- Area: Tahrongi Canyon
--  MOB: Canyon Crawler
-- Note: PH for Herbage Hunter
-----------------------------------
require("scripts/zones/Tahrongi_Canyon/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,96,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,HERBAGE_HUNTER_PH,10,math.random(3600,7200)); -- 1 to 2 hours
end;
