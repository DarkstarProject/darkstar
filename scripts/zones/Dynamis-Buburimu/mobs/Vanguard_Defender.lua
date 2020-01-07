-----------------------------------
-- Area: Dynamis - Buburimu
--  Mob: Vanguard Defender
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
    dsp.mob.phOnDespawn(mob, ID.mob.TEZHA_IRONCLAD_PH, 10, 1200) -- 20 minutes
end
