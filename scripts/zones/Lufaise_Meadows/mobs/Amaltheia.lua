-----------------------------------
-- Area: Lufaise Meadows
--  MOB: Amaltheia
-- !pos 347.897 -10.895 264.382 24
-----------------------------------
local ID = require("scripts/zones/Lufaise_Meadows/IDs");
require("scripts/globals/settings");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(ID.mob.AMALTHEIA_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
