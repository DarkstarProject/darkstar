-----------------------------------
-- Area: Middle Delkfutt's Tower
--  Mob: Giant Gatekeeper
-- Note: PH for Rhoitos and Polybotes
-----------------------------------
local ID = require("scripts/zones/Middle_Delkfutts_Tower/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 783, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 784, 2, tpz.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.RHOITOS_PH, 5, math.random(7200, 14400)) -- 2 to 4 hours (could not find info, so using Ogygos' cooldown)
    tpz.mob.phOnDespawn(mob, ID.mob.POLYBOTES_PH, 5, math.random(7200, 14400)) -- 2 to 4 hours (could not find info, so using Ogygos' cooldown)
end
