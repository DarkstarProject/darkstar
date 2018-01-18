-----------------------------------
-- Area: East Ronfaure
--  MOB: Pugil
-- Note: PH for Swamfisk
-----------------------------------
require("scripts/zones/East_Ronfaure/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,64,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,SWAMFISK_PH,7,math.random(3600,10800)); -- 1 to 3 hours
end;
