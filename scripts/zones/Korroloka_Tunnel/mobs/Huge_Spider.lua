-----------------------------------
-- Area: Korroloka Tunnel (173)
--  Mob: Huge Spider
-- Note: PH for Falcatus Aranei
-----------------------------------
local ID = require("scripts/zones/Korroloka_Tunnel/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 729, 1, dsp.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.FALCATUS_ARANEI_PH, 5, math.random(7200, 14400)) -- 2 to 4 hours
end
