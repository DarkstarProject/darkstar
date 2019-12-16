-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Doom Warlock
-- Note: Place holder Taxim
-----------------------------------
local ID = require("scripts/zones/Gustav_Tunnel/IDs");
require("scripts/globals/regimes")
require("scripts/globals/mobs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 765, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 766, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 769, 1, dsp.regime.type.GROUNDS)
end;

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob,ID.mob.TAXIM_PH,5,7200); -- 2 hours
end;
