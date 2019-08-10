-----------------------------------
-- Area: Caedarva Mire
--  ZNM: Tyger
-- !pos -766 -12 632 79
-- Spawn with Singed Buffalo: !additem 2593
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(dsp.mod.SLEEPRES,30)
    mob:addMod(dsp.mod.BINDRES,30)
    mob:addMod(dsp.mod.GRAVITYRES,30)
    mob:addMod(dsp.mod.ATT, 200)
end

function onMobDeath(mob, player, isKiller)
end