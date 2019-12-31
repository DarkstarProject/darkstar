-----------------------------------
-- Area: Labyrinth of Onzozo
--  Mob: Goblin Mercenary
-- Note: Place holder Soulstealer Skullnix
-----------------------------------
local ID = require("scripts/zones/Labyrinth_of_Onzozo/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 771, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 772, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 774, 2, dsp.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.SOULSTEALER_SKULLNIX_PH, 5, math.random(7200, 10800)) -- 2 to 3 hours
end
