-----------------------------------
-- Area: Davoi
--  MOB: Orcish Beastrider
-- Note: PH for Poisonhand Gnadgad
-----------------------------------
local ID = require("scripts/zones/Davoi/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.POISONHAND_GNADGAD_PH, 10, 3600) -- 1 hour
end