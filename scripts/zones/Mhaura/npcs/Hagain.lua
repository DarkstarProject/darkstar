-----------------------------------
--    Area: Mhaura
--    NPC: Hagain
--    Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Mhaura/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    local hittingTheMarquisate = player:getQuestStatus(WINDURST,HITTING_THE_MARQUISATE);
    
    if (hittingTheMarquisate == QUEST_ACCEPTED and trade:hasItemQty(1091,1) and trade:getItemCount() == 1) then -- Trade Chandelier coal
        player:startEvent(0x2715);            
    end

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local hittingTheMarquisateHagainCS = player:getVar("hittingTheMarquisateHagainCS");
    
    if (hittingTheMarquisateHagainCS == 1) then -- start first part of miniquest thf af3
        player:startEvent(0x2713,0,BOMB_INCENSE);        
    elseif (hittingTheMarquisateHagainCS >= 2 and hittingTheMarquisateHagainCS < 9) then -- dialog during mini quest thf af3
        player:startEvent(0x2714,0,BOMB_INCENSE);
    elseif (hittingTheMarquisateHagainCS == 9) then
        player:startEvent(0x2716);    -- after the mini quest
    else
        player:startEvent(0x2712);    -- standard dialog
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
    if (csid == 0x2713) then
        player:setVar("hittingTheMarquisateHagainCS",2);
        player:addKeyItem(BOMB_INCENSE);
        player:messageSpecial(KEYITEM_OBTAINED,BOMB_INCENSE);            
    elseif (csid == 0x2715) then
        player:setVar("hittingTheMarquisateHagainCS",9);    
        player:delKeyItem(BOMB_INCENSE);
        player:tradeComplete();
    end

end;



