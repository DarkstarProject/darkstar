-----------------------------------
-- Area: Giddeus (145)
--  MOB: Yagudo_Mendicant
-----------------------------------
local ID = require("scripts/zones/Giddeus/IDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob,ID.mob.HOO_MJUU_THE_TORRENT_PH,5,3600); -- 1 hour
end;
