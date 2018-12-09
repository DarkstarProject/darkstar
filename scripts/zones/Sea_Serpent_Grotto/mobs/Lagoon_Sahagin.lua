-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Lagoon Sahagin
-- Note: PH for Yarr the Pearleyed
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
    phOnDespawn(mob, ID.mob.YARR_THE_PEARLEYED_PH, 10, 3600) -- 1 hour
end
