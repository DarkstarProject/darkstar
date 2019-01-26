-----------------------------------
-- Area: Alzadaal Undersea Ruins (72)
--  Mob: Qiqirn Goldsmith
-- Note: PH for Cookieduster Lipiroon
-----------------------------------
local ID = require("scripts/zones/Alzadaal_Undersea_Ruins/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.COOKIEDUSTER_LIPIROON_PH, 5, 3600) -- 1 hour
end
