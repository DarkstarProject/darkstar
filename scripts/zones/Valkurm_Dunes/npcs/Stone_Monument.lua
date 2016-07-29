-----------------------------------
--  Area: Valkurm Dunes
--  NPC:  Stone Monument
--  Involved in quest "An Explorer's Footsteps"
--    @pos -311.299 -4.420 -138.878 103
-----------------------------------
package.loaded["scripts/zones/Valkurm_Dunes/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Valkurm_Dunes/TextIDs");

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
        player:setVar("anExplorer-CurrentTablet",0x00008);
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