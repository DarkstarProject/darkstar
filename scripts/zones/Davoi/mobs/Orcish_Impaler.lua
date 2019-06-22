-----------------------------------
-- Area: Davoi
--  MOB: Orcish Impaler
-- Note: PH for Poisonhand Gnadgad and Steelbiter Gudrud
-----------------------------------
local ID = require("scripts/zones/Davoi/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.POISONHAND_GNADGAD_PH, 10, 3600) -- 1 hour
    dsp.mob.phOnDespawn(mob, ID.mob.STEELBITER_GUDRUD_PH, 10, 3600) -- 1 hour
end