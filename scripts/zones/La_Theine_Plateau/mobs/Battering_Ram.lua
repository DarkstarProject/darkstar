-----------------------------------
-- Area: La Theine Plateau
--  MOB: Battering Ram
-----------------------------------
local ID = require("scripts/zones/La_Theine_Plateau/IDs");
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    if not phOnDespawn(mob, ID.mob.BLOODTEAR_PH, 10, math.random(75600, 86400)) then -- 21-24 hours
        phOnDespawn(mob, ID.mob.LUMBERING_LAMBERT_PH, 100, 1200) -- 20 min
    end
end