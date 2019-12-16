-----------------------------------
-- Area: Meriphataud Mountains
--  Mob: Coeurl
-- Note: PH for Patripatan
-----------------------------------
local ID = require("scripts/zones/Meriphataud_Mountains/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 63, 1, dsp.regime.type.FIELDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.PATRIPATAN_PH, 5, math.random(3600, 10800)) -- 1 to 3 hours
end
