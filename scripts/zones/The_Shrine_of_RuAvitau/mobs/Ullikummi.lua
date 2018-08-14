-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  MOB: Ullikummi
-----------------------------------
require("scripts/zones/The_Shrine_of_RuAvitau/MobIDs");
require("scripts/globals/settings");

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(ULLIKUMMI_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
