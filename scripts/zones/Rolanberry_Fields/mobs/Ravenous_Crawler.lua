-----------------------------------
-- Area: Rolanberry Fields
--   NM: Ravenous Crawler
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(dsp.mod.REGAIN, 100)
end

function onMobDeath(mob, player, isKiller)
end
