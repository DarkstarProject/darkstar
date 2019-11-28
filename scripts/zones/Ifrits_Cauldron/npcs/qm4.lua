-----------------------------------
-- Area: Ifrit's Cauldron
--  NPC: ???
-- Involved in Mission: Bastok 6-2
-- !pos 171 0 -25 205
-----------------------------------
local ID = require("scripts/zones/Ifrits_Cauldron/IDs")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    -- Adaman Ore: spawn Salamander and Magma for The Pirate's Cove
    if (
        player:getCurrentMission(BASTOK) == dsp.mission.id.bastok.THE_PIRATE_S_COVE and
        player:getCharVar("MissionStatus") == 2 and
        npcUtil.tradeHas(trade, 646) and
        npcUtil.popFromQM(player, npc, {ID.mob.PIRATES_COVE_NMS, ID.mob.PIRATES_COVE_NMS + 1}, {claim = false})
    ) then
        player:confirmTrade()
        GetMobByID(ID.mob.PIRATES_COVE_NMS):lookAt(player:getPos()) -- Salamander
        GetMobByID(ID.mob.PIRATES_COVE_NMS + 1):updateClaim(player) -- Magma
    end
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
