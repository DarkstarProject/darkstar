-----------------------------------
-- Area: Windurst Waters
-- NPC:  Maysoon
-- Starts and Finishes Quest: Hoist the Jelly, Roger
-- Involved in Quests: Cook's Pride
-- @zone 238
-- @pos -105 -2 69
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Waters/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(WINDURST,HOIST_THE_JELLY_ROGER) == QUEST_ACCEPTED) then 
        if (trade:hasItemQty(4508,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
            player:startEvent(0x2711); -- Finish quest "Hoist the Jelly, Roger"
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    CooksPride = player:getQuestStatus(JEUNO,COOK_S_PRIDE);
    HoistTheJelly = player:getQuestStatus(WINDURST,HOIST_THE_JELLY_ROGER);
    
    if (CooksPride == QUEST_ACCEPTED and HoistTheJelly == QUEST_AVAILABLE) then 
        player:startEvent(0x2710); -- Start quest "Hoist the Jelly, Roger"
    else
        player:startEvent(0x010a); -- Standard dialog
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
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x2710) then 
        player:addQuest(WINDURST,HOIST_THE_JELLY_ROGER);
    elseif (csid == 0x2711) then 
        player:completeQuest(WINDURST,HOIST_THE_JELLY_ROGER);
        player:addKeyItem(SUPER_SOUP_POT);
        player:messageSpecial(KEYITEM_OBTAINED,SUPER_SOUP_POT);
        player:addFame(WINDURST,30);
        player:tradeComplete();
    end
end;



