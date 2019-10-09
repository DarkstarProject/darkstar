-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Brook Sahagin
-- Note: PH for Qull the Shellbuster
-----------------------------------
local ID = require("scripts/zones/Sea_Serpent_Grotto/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 806, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 807, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 808, 1, dsp.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.QULL_THE_SHELLBUSTER_PH, 10, 7200) -- 2 hours
end
