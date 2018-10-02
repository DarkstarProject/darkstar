-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Damselfly
-- Note: Place holder Valkurm Emperor
-----------------------------------
local ID = require("scripts/zones/Valkurm_Dunes/IDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,9,1);
    checkRegime(player,mob,10,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.VALKURM_EMPEROR_PH,5,3600); -- 1 hour
end;
