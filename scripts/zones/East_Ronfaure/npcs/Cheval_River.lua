-----------------------------------
--  Area: East Ronfaure
--  NPC:  Cheval_River
--  @pos 223 -58 426 101
--  Involved in Quest: Waters of Cheval
-----------------------------------
package.loaded["scripts/zones/East_Ronfaure/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/East_Ronfaure/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (player:getQuestStatus(SANDORIA,WATER_OF_THE_CHEVAL) == QUEST_ACCEPTED and trade:hasItemQty(602, 1)) then
        if (trade:getItemCount() == 1 and player:getFreeSlotsCount() > 0) then
            player:tradeComplete();
            player:addItem(603);
            player:messageSpecial(CHEVAL_RIVER_WATER, 603);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 603);
        end;
    end;
            
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:hasItem(602) == true) then
        player:messageSpecial(BLESSED_WATERSKIN);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end;
    
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

end;




