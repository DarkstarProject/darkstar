-----------------------------------
-- Area: Davoi
--  Mob: War Lizard
-- Note: PH for Tigerbane Bakdak
-----------------------------------
local ID = require("scripts/zones/Davoi/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.TIGERBANE_BAKDAK_PH, 10, 3600) -- 1 hour
end