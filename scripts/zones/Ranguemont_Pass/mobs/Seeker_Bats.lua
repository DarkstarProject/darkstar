-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Seeker Bats
-- Note: PH for Gloom Eye
-----------------------------------
local ID = require("scripts/zones/Ranguemont_Pass/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 603, 1, tpz.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.GLOOM_EYE_PH, 10, 3600) -- 1 hour
end
