-----------------------------------
-- Area: Castle Zvahl Keep
-- NPC:  Ore door
-- Involved In Quest: Recollections
-- @pos -14 0 69 162
-----------------------------------
package.loaded["scripts/zones/Castle_Zvahl_Keep/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Castle_Zvahl_Keep/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (player:getQuestStatus(WINDURST,RECOLLECTIONS) == QUEST_ACCEPTED and player:getVar("recollectionsQuest") == 2) then
        if (trade:hasItemQty(1106,1) and trade:getItemCount() == 1) then
            player:startEvent(0x0008,1106);
        end
    end
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x0009);
    return 1;
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
    
    if (csid == 0x0008) then
        player:tradeComplete();
        player:setVar("recollectionsQuest",3);
        player:addKeyItem(FOE_FINDER_MK_I);
        player:messageSpecial(KEYITEM_OBTAINED,FOE_FINDER_MK_I);
    end
    
end;