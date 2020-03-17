-----------------------------------
-- Area: Labyrinth of Onzozo
--  Mob: Torama
-- Note: Place holder Ose
-----------------------------------
local ID = require("scripts/zones/Labyrinth_of_Onzozo/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 775, 1, tpz.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.OSE_PH, 5, 3600) -- 1 hour
end
