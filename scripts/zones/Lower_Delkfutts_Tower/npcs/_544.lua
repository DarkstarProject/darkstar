-----------------------------------
-- Area:  Lower Delkfutt's Tower
-- NPC:   Cermet Door
-- Notes: Door opens when you trade Delkfutt Key to it
-- @pos 345 0.1 20 184
-----------------------------------
package.loaded["scripts/zones/Lower_Delkfutts_Tower/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Lower_Delkfutts_Tower/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:hasItemQty(549,1) and trade:getItemCount() == 1) then -- Trade Delkfutt Key
        player:startEvent(0x0010);
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:hasKeyItem(DELKFUTT_KEY)) then
        player:startEvent(0x0010);
    else
        player:startEvent(0x000a); -- door is firmly shut
    end
    
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

function onEventFinish(player,csid,option,npc)
--print("CSID:",csid);
--print("RESULT:",option);
    
    if (csid == 0x0010 and option == 1) then 
        if (player:hasKeyItem(DELKFUTT_KEY) == false) then
            player:tradeComplete();
            player:messageSpecial(KEYITEM_OBTAINED,DELKFUTT_KEY);
            player:addKeyItem(DELKFUTT_KEY);
        end
    end
    
end;
