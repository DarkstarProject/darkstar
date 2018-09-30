-----------------------------------
-- Area: Newton Movalpolos
--  MOB: Moblin Showman
-----------------------------------
local ID = require("scripts/zones/Newton_Movalpolos/IDs");
require("scripts/globals/settings");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(ID.mob.MOBLIN_SHOWMAN):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
