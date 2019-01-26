-----------------------------------
-- Area: Bhaflau Thickets
--  MOB: Sea Puk
-- Note: Place holder Nis Puk
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Thickets/IDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob,ID.mob.NIS_PUK_PH,5,43200); -- 12 hours
end;
