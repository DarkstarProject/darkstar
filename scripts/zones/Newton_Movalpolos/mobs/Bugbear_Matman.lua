-----------------------------------
-- Area: Newton Movalpolos
--  MOB: Moblin Showman
-----------------------------------
require("scripts/zones/Newton_Movalpolos/MobIDs");
require("scripts/globals/settings");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(MOBLIN_SHOWMAN):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
