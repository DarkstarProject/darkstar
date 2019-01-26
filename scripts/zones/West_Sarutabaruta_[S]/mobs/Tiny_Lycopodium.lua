-----------------------------------
-- Area: West Saurtabaruta (S)
--  Mob: Tiny Lycopodium
-- Note: PH for Jeduah
-----------------------------------
local ID = require("scripts/zones/West_Sarutabaruta_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.JEDUAH_PH, 10, 3600) -- 1 hour
end
