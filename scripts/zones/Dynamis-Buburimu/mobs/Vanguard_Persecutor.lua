-----------------------------------
-- Area: Dynamis - Buburimu
--  Mob: Vanguard Persecutor
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
local ID = require("scripts/zones/Dynamis-Buburimu/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.KOO_RAHI_THE_LEVINBLADE_PH, 10, 1200) -- 20 minutes
end
