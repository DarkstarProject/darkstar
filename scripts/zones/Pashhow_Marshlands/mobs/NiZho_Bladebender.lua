-----------------------------------
-- Area: Pashhow Marshlands
--   NM: Ni'Zho Bladebender
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 60, 1, tpz.regime.type.FIELDS)
end
