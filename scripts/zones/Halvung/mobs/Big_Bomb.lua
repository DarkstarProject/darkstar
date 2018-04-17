-----------------------------------
-- Area: Halvung
--  MOB: Big Bomb
-----------------------------------
require("scripts/zones/Halvung/MobIDs");
require("scripts/globals/settings");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(BIG_BOMB_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
