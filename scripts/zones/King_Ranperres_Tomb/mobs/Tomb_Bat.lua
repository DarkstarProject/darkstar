-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Tomb Bat
-- Note: Place holder Crypt Ghost
-----------------------------------
local ID = require("scripts/zones/King_Ranperres_Tomb/IDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob,ID.mob.CRYPT_GHOST_PH,5,3600); -- 1 hour
end;
