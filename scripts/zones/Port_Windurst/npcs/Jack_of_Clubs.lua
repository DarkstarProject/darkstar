-----------------------------------
--    Area: Port Windurst
--    NPC: Jack of Clubs
--    Adventurer's Assistant
--    Working 100%
-------------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
require("scripts/zones/Port_Windurst/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade) 
    if (trade:getItemCount() == 1 and trade:hasItemQty(0x218,1) == true) then
        player:startEvent(0x2718,GIL_RATE*50);
        player:addGil(GIL_RATE*50);
        player:tradeComplete();
    end
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
    player:startEvent(0x2717,0,3);
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



