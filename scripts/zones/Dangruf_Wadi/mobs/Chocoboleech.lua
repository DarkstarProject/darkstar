-----------------------------------
-- Area: Dangruf Wadi (191)
--  Mob: Chocoboleech
-- !pos: -430.330 4.400 115.100
-----------------------------------
local ID = require("scripts/zones/Dangruf_Wadi/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    local npc = GetNPCByID(ID.npc.CHOCOBOLEECH_QM)
    npc:updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME)

    local positions =
    {
        {-430.330, 4.400, 115.100},
        {-492.926, 4.337,  -7.936},
        { -75.392, 2.531, 293.357},
    }
    local newPosition = npcUtil.pickNewPosition(ID.npc.CHOCOBOLEECH_QM, positions, true)
    npc:setPos(newPosition.x, newPosition.y, newPosition.z)
end