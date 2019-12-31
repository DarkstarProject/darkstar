-----------------------------------
-- Area: Middle Delkfutt's Tower
--  Mob: Giant Lobber
-- Note: PH for Rhoitos and Polybotes
-----------------------------------
local ID = require("scripts/zones/Middle_Delkfutts_Tower/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 783, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 784, 2, dsp.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.RHOITOS_PH, 5, math.random(7200, 14400)) -- 2 to 4 hours (could not find info, so using Ogygos' cooldown)
    dsp.mob.phOnDespawn(mob, ID.mob.POLYBOTES_PH, 5, math.random(7200, 14400)) -- 2 to 4 hours (could not find info, so using Ogygos' cooldown)
end
