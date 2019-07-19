-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Young Opo-opo
-- Note: PH for Mischievous Micholas
-----------------------------------
local ID = require("scripts/zones/Yuhtunga_Jungle/IDs");
require("scripts/globals/regimes")
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 126, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 128, 1, dsp.regime.type.FIELDS)
end;

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob,ID.mob.MISCHIEVOUS_MICHOLAS_PH,20,3600); -- 1 hour
end;
