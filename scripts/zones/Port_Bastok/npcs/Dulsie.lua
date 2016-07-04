-----------------------------------
--    Area: Port Bastok
--    NPC: Dulsie
--    Adventurer's Assistant
--    Working 100%
-------------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/settings");
require("scripts/zones/Port_Bastok/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade) 
    
    if (trade:hasItemQty(0x218,1) and trade:getItemCount() == 1) then
        player:startEvent(0x0008);
    end
    
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
    player:startEvent(0x0007);
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
        player:addGil(GIL_RATE*50);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*50);
    end
    
end;