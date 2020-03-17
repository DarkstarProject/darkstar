-----------------------------------
-- Area: Pashhow Marshlands
--  Mob: Veteran Quadav
-- Note: PH for Ni'Zho Bladebender
-----------------------------------
local ID = require("scripts/zones/Pashhow_Marshlands/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 60, 1, tpz.regime.type.FIELDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.NI_ZHO_BLADEBENDER_PH, 10, 3600) -- 1 hour
end
