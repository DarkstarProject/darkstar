-----------------------------------
-- Area: Lufaise Meadows
--  MOB: Kurrea
-----------------------------------
require("scripts/zones/Lufaise_Meadows/MobIDs");
require("scripts/globals/settings");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(KURREA_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
