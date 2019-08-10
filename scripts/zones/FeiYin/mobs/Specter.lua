-----------------------------------
-- Area: Fei'Yin
--  Mob: Specter
-- Note: PH for N/E/S/W Shadow NMs
-----------------------------------
require("scripts/globals/regimes")
local ID = require("scripts/zones/FeiYin/IDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 712, 1, dsp.regime.type.GROUNDS)
end;

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob,ID.mob.NORTHERN_SHADOW_PH,5,57600); -- 16 hours
    dsp.mob.phOnDespawn(mob,ID.mob.EASTERN_SHADOW_PH,5,36000); -- 10 hours
    dsp.mob.phOnDespawn(mob,ID.mob.WESTERN_SHADOW_PH,5,36000); -- 10 hours
    dsp.mob.phOnDespawn(mob,ID.mob.SOUTHERN_SHADOW_PH,5,57600); -- 16 hours
end;
