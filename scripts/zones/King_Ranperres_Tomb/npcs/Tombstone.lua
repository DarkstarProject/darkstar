-----------------------------------
-- Area: King Ranperre's Tomb
--  NPC: Tombstone
-- Involved in Quest: Grave Concerns
-- !pos 1 0.1 -101 190
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/missions")
require("scripts/globals/quests")
local ID = require("scripts/zones/King_Ranperres_Tomb/IDs")
-----------------------------------

function onTrade(player, npc, trade)

        if (player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.GRAVE_CONCERNS) == QUEST_ACCEPTED) then
            if (trade:hasItemQty(567, 1) and trade:getItemCount() == 1) then -- Trade Well Water
            player:startEvent(3)
            end
        end
end

function onTrigger(player, npc)
    local currentMission = player:getCurrentMission(SANDORIA)
    local MissionStatus = player:getVar("MissionStatus")
    local BatHuntCompleted = player:hasCompletedMission(SANDORIA, dsp.mission.id.sandoria.BAT_HUNT) -- quest repeatable and clicking tombstone should not produce cutscene on repeat
    local X = npc:getXPos()
    local Z = npc:getZPos()

    if (X >= -1 and X <= 1 and Z >= -106 and Z <= -102) then
        if (currentMission == dsp.mission.id.sandoria.BAT_HUNT and MissionStatus <= 1) then
            player:startEvent(4)
        else
            player:startEvent(2)
        end
    elseif (currentMission == dsp.mission.id.sandoria.RANPERRE_S_FINAL_REST and MissionStatus == 2) then
        player:startEvent(8)
    end

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

    if (csid == 4) then
        player:setVar("MissionStatus", 2)
    elseif (csid == 2) then
        local graveConcerns = player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.GRAVE_CONCERNS)

        if (graveConcerns == QUEST_ACCEPTED and player:hasItem(547) == false and player:hasItem(567) == false) then
            if (player:getFreeSlotsCount() == 0) then
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 547) -- Tomb Waterskin
            else
                player:addItem(547)
                player:messageSpecial(ID.text.ITEM_OBTAINED, 547) -- Tomb Waterskin
            end
        end
    elseif (csid == 3) then
        player:tradeComplete()
        player:setVar("OfferingWaterOK", 1)
        player:addItem(547)
        player:messageSpecial(ID.text.ITEM_OBTAINED, 547) -- Tomb Waterskin
    elseif (csid == 8) then
        player:setVar("MissionStatus", 3)
        player:addKeyItem(dsp.ki.ANCIENT_SANDORIAN_BOOK)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.ANCIENT_SANDORIAN_BOOK)
    end

end
