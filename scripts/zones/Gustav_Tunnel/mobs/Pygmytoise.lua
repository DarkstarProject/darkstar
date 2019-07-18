-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Pygmytoise
-----------------------------------
require("scripts/globals/regimes")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(dsp.mod.MDEF, 250) -- "Highly resistant to magic damage"
    mob:setMod(dsp.mod.THUNDERRES, 75) -- "Very resistant to Lightning damage"
end

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 770, 2, dsp.regime.type.GROUNDS)
end;