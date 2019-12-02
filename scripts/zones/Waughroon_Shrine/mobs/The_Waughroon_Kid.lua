-----------------------------------
-- Area: Waughroon Shrine
--  Mob: The Waughroon Kid
-- BCNM: The Final Bout
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(tpz.mod.REGAIN, 100)
end

function onMobDeath(mob, player, isKiller)
end
