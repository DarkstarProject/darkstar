-----------------------------------
-- Area: Yhoator Jungle
--  MOB: Edacious Opo-opo
-----------------------------------
require("scripts/zones/Yhoator_Jungle/MobIDs")
require("scripts/globals/settings")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    GetNPCByID(EDACIOUS_OPO_OPO_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME)
end
