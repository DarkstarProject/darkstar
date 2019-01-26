-----------------------------------
-- Area: Misareaux_Coast
--  Mob: Diatryma
-- Note: PH for Okyupete
-----------------------------------
local ID = require("scripts/zones/Misareaux_Coast/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.OKYUPETE_PH, 10, 3600) -- 1 hour
end
