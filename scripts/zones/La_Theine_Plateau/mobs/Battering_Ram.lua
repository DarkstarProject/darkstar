-----------------------------------
-- Area: La Theine Plateau
--   NM: Battering Ram
-----------------------------------
local ID = require("scripts/zones/La_Theine_Plateau/IDs")
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    if not dsp.mob.phOnDespawn(mob, ID.mob.BLOODTEAR_PH, 5, math.random(75600, 86400)) then -- 21-24 hours
        dsp.mob.phOnDespawn(mob, ID.mob.LUMBERING_LAMBERT_PH, 5, 3600) -- 1 hour
    end
end