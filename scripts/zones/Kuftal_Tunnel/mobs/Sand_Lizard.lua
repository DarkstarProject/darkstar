-----------------------------------
-- Area: Kuftal Tunnel
--  Mob: Sand Lizard
-- Note: Place Holder for Amemet
-----------------------------------
local ID = require("scripts/zones/Kuftal_Tunnel/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 735, 2, dsp.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.AMEMET_PH, 5, math.random(7200, 43200)) -- 2 to 12 hours
end
