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
    tpz.regime.checkRegime(player, mob, 790, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 791, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 792, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 793, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 794, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 795, 1, tpz.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.TONBERRY_KINQ_PH, 10, 21600) -- 6 hours, 10% pop chance
end