-----------------------------------
-- Area: Bastok Mines
-- NPC:  Virnage
-- Starts Quest: Altana's Sorrow
-- @zone 234
-- @pos 0 0 51
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    AltanaSorrow = player:getQuestStatus(BASTOK,ALTANA_S_SORROW);
    
    if (AltanaSorrow == QUEST_AVAILABLE and player:getFameLevel(BASTOK) >= 4 and player:getMainLvl() >= 10) then
        player:startEvent(0x008d); -- Start quest "Altana's Sorrow"
    elseif (AltanaSorrow == QUEST_ACCEPTED) then
        if (player:hasKeyItem(BUCKET_OF_DIVINE_PAINT) == true) then
            player:startEvent(0x008f); -- CS with Bucket of Divine Paint KI 
        elseif (player:hasKeyItem(LETTER_FROM_VIRNAGE) == true) then
            --player:showText(npc,VIRNAGE_DIALOG_2); 
            player:startEvent(0x0090); -- During quest (after KI)
        else
            -- player:showText(npc,VIRNAGE_DIALOG_1);
            player:startEvent(0x008e); -- During quest "Altana's Sorrow" (before KI)
        end
    elseif (AltanaSorrow == QUEST_COMPLETED) then
        player:startEvent(0x0091); -- New standard dialog
    else
        player:startEvent(0x008c); -- Standard dialog
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if (csid == 0x008d and option == 0) then
        player:addQuest(BASTOK,ALTANA_S_SORROW);
    elseif (csid == 0x008f) then
        player:delKeyItem(BUCKET_OF_DIVINE_PAINT);
        player:addKeyItem(LETTER_FROM_VIRNAGE);
        player:messageSpecial(KEYITEM_OBTAINED,LETTER_FROM_VIRNAGE);
    end
end;