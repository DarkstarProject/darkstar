-----------------------------------
-- Area: Konschtat Highlands
--  Mob: Tremor Ram
-----------------------------------
local ID = require("scripts/zones/Konschtat_Highlands/IDs")
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    -- If Steelflect doesn't pop next, fallback onto Rampaging Ram
    if not phOnDespawn(mob, ID.mob.STEELFLEECE_PH, 10, math.random(75600, 86400)) then -- 21-24 hours
        phOnDespawn(mob, ID.mob.RAMPAGING_RAM_PH, 10, 1200) -- 20 min
    end
end