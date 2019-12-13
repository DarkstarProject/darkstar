-----------------------------------
-- Area: West Sarutabaruta
--  Mob: Carrion Crow
-- Note: PH for Nunyenunc
-----------------------------------
local ID = require("scripts/zones/West_Sarutabaruta/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 28, 2, dsp.regime.type.FIELDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.NUNYENUNC_PH, 10, math.random(7200,10800)) -- 2 to 3 hours
end
