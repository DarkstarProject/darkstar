-----------------------------------
-- Area: Bhaflau Thickets
--  MOB: Olden Treant
-- Note: Place holder Emergent Elm
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Thickets/IDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob,ID.mob.EMERGENT_ELM_PH,5,14400); -- 4 hours
end;
