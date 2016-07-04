-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  Granite Door
-- Leads to painbrush room @ F-7
-- @pos 60 0.1 8 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Temple_of_Uggalepih/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (trade:hasItemQty(1136,1) and trade:getItemCount() == 1 and player:getZPos() < 11) then -- trade Uggalepih key
        player:startEvent(0x002E);
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getZPos() < 11) then
        player:messageSpecial(THE_DOOR_IS_LOCKED,1136);
    else
        player:startEvent(0x002F);
    end
    
    return 0;
    
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
    
    if (csid == 0x002E) then
        player:tradeComplete();
        player:messageSpecial(YOUR_KEY_BREAKS,0000,1136);
    end
    
end;