-----------------------------------
-- Area: Labyrinth of Onzozo
--  Mob: Labyrinth Manticore
-- Note: Place holder Narasimha
-----------------------------------
local ID = require("scripts/zones/Labyrinth_of_Onzozo/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 775, 2, dsp.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.NARASIMHA_PH, 5, math.random(21600, 36000)) -- 6 to 10 hours
end
