-----------------------------------
-- Area: Talacca_Cove
-- NPC:  ??? (corsair job flag quest)
-- 
-----------------------------------
package.loaded["scripts/zones/Talacca_Cove/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Talacca_Cove/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    LuckOfTheDraw = player:getVar("LuckOfTheDraw");
    
    if (LuckOfTheDraw ==3) then
        player:startEvent(0x0002);        
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);

    if (csid == 0x0002) then
        player:setVar("LuckOfTheDraw",4);    
        player:addKeyItem(FORGOTTEN_HEXAGUN);
        player:messageSpecial(KEYITEM_OBTAINED,FORGOTTEN_HEXAGUN);
    end

end;