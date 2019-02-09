-----------------------------------
-- Area: Castle Zvahl Baileys
--  Mob: Doom Demon
-- Note: PH for Marquis Sabnock
-----------------------------------
local ID = require("scripts/zones/Castle_Zvahl_Baileys/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.MARQUIS_SABNOCK_PH, 10, 7200) -- 2 hour
end
