-----------------------------------
-- Area: Temple of Uggalepih
--  Mob: Tonberry Dismayer
-- Note: PH for Tonberry Kinq
-----------------------------------
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs")
mixins = {require("scripts/mixins/families/tonberry")}
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 790, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 791, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 792, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 793, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 794, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 795, 1, dsp.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.TONBERRY_KINQ_PH, 10, 21600) -- 6 hours, 10% pop chance
end