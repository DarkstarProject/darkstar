-----------------------------------
-- Area: Riverne - Site B01
--  MOB: Nimbus Hippogryph
-- Note: Place holder Imdugud
-----------------------------------
local ID = require("scripts/zones/Riverne-Site_B01/IDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob,ID.mob.IMDUGUD_PH,10,75600); -- 21 hours
end;
