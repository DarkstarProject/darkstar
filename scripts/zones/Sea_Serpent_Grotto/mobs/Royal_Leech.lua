-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Royal Leech
-- Note: PH for Masan
-----------------------------------
local ID = require("scripts/zones/Sea_Serpent_Grotto/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 804, 1, tpz.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.MASAN_PH, 10, 14400) -- 4 hours
end
