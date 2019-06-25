-----------------------------------
-- Area: Horlais Peak
--  Mob: Gerjis
-- BCNM: Eye of the Tiger
-- TODO: code special attacks Crossthrash and Gerjis' Grip
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(dsp.mod.EVA, 50)
end

function onMobDeath(mob, player, isKiller)
end
