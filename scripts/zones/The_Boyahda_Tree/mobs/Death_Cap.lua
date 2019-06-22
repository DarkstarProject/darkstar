-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Death Cap
-- Note: PH for Ellyllon
-----------------------------------
local ID = require("scripts/zones/The_Boyahda_Tree/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 719, 1, dsp.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.ELLYLLON_PH, 10, math.random(7200,10800)) -- 2 to 3 hours
end
