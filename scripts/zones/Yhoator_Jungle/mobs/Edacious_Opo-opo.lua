-----------------------------------
-- Area: Yhoator Jungle
--  MOB: Edacious Opo-opo
-----------------------------------
local ID = require("scripts/zones/Yhoator_Jungle/IDs")
require("scripts/globals/settings")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    GetNPCByID(ID.npc.EDACIOUS_OPO_OPO_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME)
end
