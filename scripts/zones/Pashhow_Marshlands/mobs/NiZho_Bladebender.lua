-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: Ni'Zho Bladebender
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 60, 1, dsp.regime.type.FIELDS)
end;
