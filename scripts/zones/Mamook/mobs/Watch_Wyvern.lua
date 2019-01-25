-----------------------------------
-- Area: Mamook
--  Mob: Watch Wyvern
-- Note: PH for Firedance Magmaal Ja
-----------------------------------
local ID = require("scripts/zones/Mamook/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.FIREDANCE_MAGMAAL_JA_PH, 5, 3600) -- 1 hour
end
