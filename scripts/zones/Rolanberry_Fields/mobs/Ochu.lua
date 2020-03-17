-----------------------------------
-- Area: Rolanberry Fields
--  Mob: Ochu
-- Note: PH for Drooling Daisy
-----------------------------------
local ID = require("scripts/zones/Rolanberry_Fields/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 88, 1, tpz.regime.type.FIELDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.DROOLING_DAISY_PH, 10, 3600) -- 1 hour
end
