-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Pygmytoise
-----------------------------------
require("scripts/globals/regimes")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(dsp.mod.DMGMAGIC, -50) -- "Highly resistant to magic damage"
end

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 770, 2, dsp.regime.type.GROUNDS)
end;