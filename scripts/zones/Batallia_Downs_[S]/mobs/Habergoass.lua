-----------------------------------
-- Area: Batallia Downs [S]
--   NM: Habergoass
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(dsp.mod.REGAIN, 75)
end

function onMobDeath(mob, player, isKiller)
end
