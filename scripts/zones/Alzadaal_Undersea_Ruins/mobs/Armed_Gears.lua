-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  MOB: Armed Gears
-- !pos -19 -4 -153
-----------------------------------
-- todo
-- add add random elemental magic absorb to elements its casting

mixins =
{
    require("scripts/mixins/job_special"),
    require("scripts/mixins/families/gears")
}
require("scripts/globals/status")

function onMobInitialize(mob)
    mob:addMod(dsp.mod.MDEF, 60)
    mob:addMod(dsp.mod.DEF, 60)
    mob:AnimationSub(0)
end

function onMobDeath(mob, player, isKiller)
end