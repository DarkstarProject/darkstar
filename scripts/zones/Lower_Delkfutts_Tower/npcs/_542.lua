-----------------------------------
-- Area: Lower Delkfutt's Tower
--  NPC: Cermet Door
-- Cermet Door for Basty Ambassador
-- Bastok Mission 3.3 "Appointment to Jeuno"
-- !pos 596 16 -19 184
-----------------------------------
local ID = require("scripts/zones/Lower_Delkfutts_Tower/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    if
        player:getCurrentMission(BASTOK) == dsp.mission.id.bastok.JEUNO_MISSION and
        player:getVar("MissionStatus") == 2 and
        npcUtil.tradeHas(trade, 549) -- Delkfutt Key
    then
        player:startEvent(1)
    end
end

function onTrigger(player, npc)
    local currentMission = player:getCurrentMission(BASTOK)

    if currentMission == dsp.mission.id.bastok.JEUNO_MISSION and player:getVar("MissionStatus") == 2 and not player:hasKeyItem(dsp.ki.DELKFUTT_KEY) then
        player:messageSpecial(ID.text.THE_DOOR_IS_FIRMLY_SHUT_OPEN_KEY)
    elseif currentMission == dsp.mission.id.bastok.JEUNO_MISSION and player:getVar("MissionStatus") == 2 and player:hasKeyItem(dsp.ki.DELKFUTT_KEY) then
        player:startEvent(1)
    else
        player:messageSpecial(ID.text.DOOR_FIRMLY_SHUT)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 1 then
        player:setVar("MissionStatus", 3)

        if not player:hasKeyItem(dsp.ki.DELKFUTT_KEY) then
            npcUtil.giveKeyItem(player, dsp.ki.DELKFUTT_KEY)
            player:confirmTrade()
        end
    end
end