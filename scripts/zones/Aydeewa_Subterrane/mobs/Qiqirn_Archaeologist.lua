-----------------------------------
-- Area: Aydeewa Subterrane
--  Mob: Qiqirn Archaeologist
-- Note: PH for Bluestreak Gyugyuroon
-----------------------------------
local ID = require("scripts/zones/Aydeewa_Subterrane/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.BLUESTREAK_GYUGYUROON_PH, 10, 7200) -- 2 hours
end
