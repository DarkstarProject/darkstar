-----------------------------------
-- Area: East Ronfaure
--  MOB: Carrion Worm
-- Note: PH for Bigmouth Billy
-----------------------------------
local ID = require("scripts/zones/East_Ronfaure/IDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,65,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.BIGMOUTH_BILLY_PH,7,math.random(3600,7200)); -- 1 to 2 hours
end;
