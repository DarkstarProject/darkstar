-----------------------------------
-- Area: Meriphataud Mountains
--  Mob: Raptor
-- Note: PH for Daggerclaw Dracos
-----------------------------------
local ID = require("scripts/zones/Meriphataud_Mountains/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 39, 1, tpz.regime.type.FIELDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.DAGGERCLAW_DRACOS_PH, 10, 3600) -- 1 hour
end
