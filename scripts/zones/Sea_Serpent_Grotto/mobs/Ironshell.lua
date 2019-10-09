-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Ironshell
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.CHARMABLE, 1)
end

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 805, 1, dsp.regime.type.GROUNDS)
end
