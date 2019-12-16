-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Sand Beetle
-- Note: PH for Donnergugi
-----------------------------------
local ID = require("scripts/zones/Eastern_Altepa_Desert/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 110, 3, dsp.regime.type.FIELDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.DONNERGUGI_PH, 10, 3600) -- 1 hour
end
