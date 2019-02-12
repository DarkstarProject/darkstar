-----------------------------------
-- Area: Attohwa Chasm
--  MOB: Corse
-- Note: PH for Citipati
-----------------------------------
local ID = require("scripts/zones/Attohwa_Chasm/IDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob,ID.mob.CITIPATI_PH,20,math.random(9216,19584)); -- 3 to 6 game nights
end;
