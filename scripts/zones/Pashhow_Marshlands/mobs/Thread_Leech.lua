-----------------------------------
-- Area: Pashhow Marshlands
--  Mob: Thread Leech
-- Note: PH for Bloodpool Vorax
-----------------------------------
local ID = require("scripts/zones/Pashhow_Marshlands/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 22, 1, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 23, 2, tpz.regime.type.FIELDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.BLOODPOOL_VORAX_PH, 5, 600) -- 10 minutes
end
