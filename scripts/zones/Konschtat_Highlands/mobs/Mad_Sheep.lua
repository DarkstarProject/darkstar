-----------------------------------
-- Area: Konschtat Highlands
--  Mob: Mad Sheep
-- Note: Place holder Stray Mary
-----------------------------------
local ID = require("scripts/zones/Konschtat_Highlands/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if player:getCharVar("TutorialProgress") == 7 then
        player:setCharVar("TutorialProgress", 8)
    end
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.STRAY_MARY_PH, 5, math.random(300, 3600)) -- 5-60 minutes
end
