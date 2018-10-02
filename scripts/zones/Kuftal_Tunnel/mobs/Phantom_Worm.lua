-----------------------------------
-- Area: Kuftal Tunnel (173)
--  Mob: Phantom Worm
-----------------------------------
local ID = require("scripts/zones/Kuftal_Tunnel/IDs");
require("scripts/globals/settings");
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(ID.npc.PHANTOM_WORM_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
