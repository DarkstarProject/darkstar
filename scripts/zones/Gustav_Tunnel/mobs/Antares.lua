----------------------------------
-- Area: Gustav Tunnel
--  MOB: Antares
-- Note: Place holder Amikiri
-----------------------------------
local ID = require("scripts/zones/Gustav_Tunnel/IDs");
require("scripts/globals/regimes")
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 768, 2, dsp.regime.type.GROUNDS)
end;

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob,ID.mob.AMIKIRI_PH,5,math.random(25200,32400)); -- 7 to 9 hours
end;
