-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Boyahda Sapling
-- Note: PH for Leshonki
-----------------------------------
local ID = require("scripts/zones/The_Boyahda_Tree/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 725, 1, dsp.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.LESHONKI_PH, 5, 3600) -- 1 hour
end
