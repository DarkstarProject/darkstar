-----------------------------------
-- Area: Lufaise Meadows
--  MOB: Amaltheia
-- !pos 347.897 -10.895 264.382 24
-----------------------------------
require("scripts/zones/Lufaise_Meadows/MobIDs");
require("scripts/globals/settings");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(AMALTHEIA_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
