-----------------------------------
-- Area: Palborough Mines
--  Mob: Old Quadav
-- Note: PH for Be'Hya Hundredwall
-----------------------------------
local ID = require("scripts/zones/Palborough_Mines/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.BEHYA_HUNDREDWALL_PH, 10, 3600) -- 1 hour
end
