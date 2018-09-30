-----------------------------------
-- Area: Lufaise Meadows
--  MOB: Kurrea
-----------------------------------
local ID = require("scripts/zones/Lufaise_Meadows/IDs");
require("scripts/globals/settings");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(ID.mob.KURREA_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
