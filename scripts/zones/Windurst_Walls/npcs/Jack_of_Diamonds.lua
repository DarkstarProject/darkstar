-----------------------------------
--    Area: Windurst Walls
--    NPC: Jack of Diamonds
--    Adventurer's Assistant
--    Working 100%
-------------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
require("scripts/zones/Windurst_Walls/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade) 
    if (trade:getItemCount() == 1 and trade:hasItemQty(0x218,1) == true) then
        player:startEvent(0x2712,GIL_RATE*50);
        player:addGil(GIL_RATE*50);
        player:tradeComplete();
    end
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
    player:startEvent(0x2711,0,2);
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



