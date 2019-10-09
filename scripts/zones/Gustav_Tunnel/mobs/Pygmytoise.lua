-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Pygmytoise
-----------------------------------
require("scripts/globals/regimes")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    --[[
    Attempt to Aproximate retail damage ratios,
    the current resist rates can't do the job..
    What retail appears to do per info on BG is FORCE a minimum resist teir
    along with a damage bonus on ice (all spell get a partial resist).
    These are annoyingly x/256 scaled.
    ]]
    mob:setMod(dsp.mod.FIREDEF, 128)
    mob:setMod(dsp.mod.ICEDEF, 52)
    mob:setMod(dsp.mod.WINDDEF, 128)
    mob:setMod(dsp.mod.EARTHDEF, 200)
    mob:setMod(dsp.mod.THUNDERDEF, 200)
    mob:setMod(dsp.mod.WATERDEF, 128)
    mob:setMod(dsp.mod.LIGHTDEF, 128)
    mob:setMod(dsp.mod.DARKDEF, 128)
end

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 770, 2, dsp.regime.type.GROUNDS)
end
