-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC:  Dkhaaya
--  Type: Standard NPC
--  @pos -73.212 -1 -5.842 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
require("scripts/globals/quests");
 
-----------------------------------
-- onTrade Action
-----------------------------------
 
function onTrade(player,npc,trade)
end;
 
-----------------------------------
-- onTrigger Action
-----------------------------------
 
function onTrigger(player,npc)
    local olduumQuest = player:getQuestStatus(AHT_URHGAN, OLDUUM);
    local ringCheck = player:hasItem(2217);
    if (olduumQuest == QUEST_AVAILABLE) then
        player:startEvent(0x004);
    elseif (player:hasKeyItem(ELECTROLOCOMOTIVE) or player:hasKeyItem(ELECTROPOT) or player:hasKeyItem(ELECTROCELL) and ringCheck == false) then
        if (olduumQuest == QUEST_ACCEPTED) then
            player:startEvent(0x006);
        else
            player:startEvent(0x008);
        end
    elseif (olduumQuest ~= QUEST_AVAILABLE and ringCheck == false) then
        player:startEvent(0x005);
    else
        player:startEvent(0x007);
   
    end
end;
 
-----------------------------------
-- onEventUpdate
-----------------------------------
 
function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
 
-----------------------------------
-- onEventFinish
-----------------------------------
 
function onEventFinish(player,csid,option)
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);

    if (csid == 0x004) then
        player:addKeyItem(DKHAAYAS_RESEARCH_JOURNAL);
        player:messageSpecial(KEYITEM_OBTAINED, DKHAAYAS_RESEARCH_JOURNAL);
        player:addQuest(AHT_URHGAN, OLDUUM);
    elseif (csid == 0x006 or csid == 0x008) then
        if (player:getFreeSlotsCount() >= 1) then
            player:addItem(2217);
            player:messageSpecial(ITEM_OBTAINED, 2217);
            player:delKeyItem(DKHAAYAS_RESEARCH_JOURNAL);
            player:delKeyItem(ELECTROLOCOMOTIVE);
            player:delKeyItem(ELECTROPOT);
            player:delKeyItem(ELECTROCELL);
            if (csid == 0x006) then
                player:completeQuest(AHT_URHGAN, OLDUUM);
            end
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 2217);
        end

    end
end;
