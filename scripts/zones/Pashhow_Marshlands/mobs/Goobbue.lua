-----------------------------------
-- Area: Pashhow Marshlands
--  Mob: Goobbue
-- Note: PH for Jolly Green
-----------------------------------
local ID = require("scripts/zones/Pashhow_Marshlands/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 60, 3, tpz.regime.type.FIELDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.JOLLY_GREEN_PH, 5, 1) -- 1 second / no cooldown
end