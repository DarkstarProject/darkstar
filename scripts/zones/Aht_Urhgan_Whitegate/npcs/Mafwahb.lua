-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Mafwahb
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    local LuckOfTheDraw = player:getVar("LuckOfTheDraw");
    
    if (LuckOfTheDraw ==1) then
        player:startEvent(0x0224);    
        player:setVar("LuckOfTheDraw",2);        
    else
        player:startEvent(0x0287);
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



