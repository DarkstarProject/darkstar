-----------------------------------
-- Area: East Ronfaure
--  Mob: Pugil
-- Note: PH for Swamfisk
-----------------------------------
local ID = require("scripts/zones/East_Ronfaure/IDs");
require("scripts/globals/regimes")
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 64, 1, dsp.regime.type.FIELDS)
end;

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob,ID.mob.SWAMFISK_PH,7,math.random(3600,10800)); -- 1 to 3 hours
end;
