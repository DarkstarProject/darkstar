-----------------------------------
-- Area: Den of Rancor
--   NM: Hakutaku
-----------------------------------
local ID = require("scripts/zones/Den_of_Rancor/IDs")
require("scripts/globals/settings")
-----------------------------------

function onMobSpawn(mob)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    GetNPCByID(ID.npc.HAKUTAKU_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME)
end