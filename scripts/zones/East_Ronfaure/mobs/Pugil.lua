-----------------------------------
-- Area: East Ronfaure
--  MOB: Pugil
-- Note: PH for Swamfisk
-----------------------------------
local ID = require("scripts/zones/East_Ronfaure/IDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,64,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.SWAMFISK_PH,7,math.random(3600,10800)); -- 1 to 3 hours
end;
