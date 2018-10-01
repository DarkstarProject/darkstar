-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  MOB: Ullikummi
-----------------------------------
local ID = require("scripts/zones/The_Shrine_of_RuAvitau/IDs");
require("scripts/globals/settings");

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(ID.npc.ULLIKUMMI_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
