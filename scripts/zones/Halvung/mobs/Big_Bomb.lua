-----------------------------------
-- Area: Halvung
--  MOB: Big Bomb
-----------------------------------
local ID = require("scripts/zones/Halvung/IDs");
require("scripts/globals/settings");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(ID.npc.BIG_BOMB_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
