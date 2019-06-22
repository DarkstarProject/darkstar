-----------------------------------
-- Area: Den of Rancor
--  MOB: Tonberry Slasher
-- Note: PH for Tawny-fingered Mugberry
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}
local ID = require("scripts/zones/Den_of_Rancor/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 798, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 799, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 800, 2, dsp.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.TAWNY_FINGERED_MUGBERRY_PH, 5, 3600) -- 1 hour
end
