-----------------------------------
-- Area: Den of Rancor
--   NM: Hakutaku
-----------------------------------
require("scripts/zones/Den_of_Rancor/MobIDs")
require("scripts/globals/settings")
-----------------------------------

function onMobSpawn(mob)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    GetNPCByID(HAKUTAKU_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME)
end