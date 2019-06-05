-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Dkhaaya
-- Type: Standard NPC
-- !pos -73.212 -1 -5.842 50
-----------------------------------
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local olduumQuest = player:getQuestStatus(AHT_URHGAN, dsp.quest.id.ahtUrhgan.OLDUUM)
    local ringCheck = player:hasItem(2217)
    if olduumQuest == QUEST_AVAILABLE then
        player:startEvent(4)
    elseif player:hasKeyItem(dsp.ki.ELECTROLOCOMOTIVE) or player:hasKeyItem(dsp.ki.ELECTROPOT) or player:hasKeyItem(dsp.ki.ELECTROCELL) and ringCheck == false then
        if olduumQuest == QUEST_ACCEPTED then
            player:startEvent(6)
        else
            player:startEvent(8)
        end
    elseif olduumQuest ~= QUEST_AVAILABLE and ringCheck == false then
        player:startEvent(5)
    else
        player:startEvent(7)

    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if csid == 4 then
        player:addKeyItem(dsp.ki.DKHAAYAS_RESEARCH_JOURNAL)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.DKHAAYAS_RESEARCH_JOURNAL)
        player:addQuest(AHT_URHGAN, dsp.quest.id.ahtUrhgan.OLDUUM)
    elseif csid == 6 or csid == 8 then
        if player:getFreeSlotsCount() >= 1 then
            player:addItem(2217)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 2217)
            player:delKeyItem(dsp.ki.DKHAAYAS_RESEARCH_JOURNAL)
            player:delKeyItem(dsp.ki.ELECTROLOCOMOTIVE)
            player:delKeyItem(dsp.ki.ELECTROPOT)
            player:delKeyItem(dsp.ki.ELECTROCELL)
            if csid == 6 then
                player:completeQuest(AHT_URHGAN, dsp.quest.id.ahtUrhgan.OLDUUM)
            end
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 2217)
        end

    end
end
