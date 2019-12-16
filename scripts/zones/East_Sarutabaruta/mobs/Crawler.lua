-----------------------------------
-- Area: East Sarutabaruta
--  Mob: Crawler
-- Note: PH for Spiny Spipi
-----------------------------------
local ID = require("scripts/zones/East_Sarutabaruta/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 92, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 93, 2, dsp.regime.type.FIELDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.SPINY_SPIPI_PH, 10, math.random(2700,7200)) -- 45 to 120 minutes
end
