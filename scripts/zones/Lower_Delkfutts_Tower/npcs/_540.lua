-----------------------------------
-- Area: Lower Delkfutt's Tower
--  NPC: Cermet Door
-- Cermet Door for Windy Ambassador
-- Windurst Mission 3.3 "A New Journey"
-- !pos 636 16 59 184
-----------------------------------
local ID = require("scripts/zones/Lower_Delkfutts_Tower/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

function onTrade(player, npc, trade)
    if player:getCurrentMission(WINDURST) == A_NEW_JOURNEY and player:getVar("MissionStatus") == 2 then
        if trade:hasItemQty(549, 1) and trade:getItemCount() == 1 then -- Delkfutt Key
            player:startEvent(2)
        end
    end
end

function onTrigger(player, npc)
    local currentMission = player:getCurrentMission(WINDURST)

    if currentMission == A_NEW_JOURNEY and player:getVar("MissionStatus") == 2 and not player:hasKeyItem(dsp.ki.DELKFUTT_KEY) then
        player:messageSpecial(ID.text.THE_DOOR_IS_FIRMLY_SHUT_OPEN_KEY)
    elseif currentMission == A_NEW_JOURNEY and player:getVar("MissionStatus") == 2 and player:hasKeyItem(dsp.ki.DELKFUTT_KEY) then
        player:startEvent(2)
    else
        player:messageSpecial(ID.text.DOOR_FIRMLY_SHUT)
    end

    return 1
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 2 then
        if not player:hasKeyItem(dsp.ki.DELKFUTT_KEY) then
            player:tradeComplete()
            player:addKeyItem(dsp.ki.DELKFUTT_KEY)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.DELKFUTT_KEY)
        end
        player:setVar("MissionStatus", 3)
    end
end