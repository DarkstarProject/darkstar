-----------------------------------
--  Area: Sauromugue Champaign
--  NPC:  Stone Monument
--  Involved in quest "An Explorer's Footsteps"
--  @pos 77.544 -2.746 -184.803 120
-----------------------------------
package.loaded["scripts/zones/Sauromugue_Champaign/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Sauromugue_Champaign/TextIDs");

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x0384);
end;

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:getItemCount() == 1 and trade:hasItemQty(571,1)) then
        player:tradeComplete();
        player:addItem(570);
        player:messageSpecial(ITEM_OBTAINED,570);
        player:setVar("anExplorer-CurrentTablet",0x08000);
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
end;