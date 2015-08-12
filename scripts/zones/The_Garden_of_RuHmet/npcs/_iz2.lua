-----------------------------------
--  Area: The Garden of RuHmet
--  NPC:  _iz2 (Ebon_Panel)
--  @pos 422.351 -5.180 -100.000 35 | Hume Tower
-----------------------------------
package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Garden_of_RuHmet/TextIDs");
require("scripts/globals/missions");
require("scripts/globals/titles");
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
    local Race = player:getRace();
    
    if (player:getCurrentMission(COP) == WHEN_ANGELS_FALL  and player:getVar("PromathiaStatus") == 1) then
        player:startEvent(0x00CA);     
    elseif (player:getCurrentMission(COP) == WHEN_ANGELS_FALL  and player:getVar("PromathiaStatus") == 2) then		
        if ( Race==2 or Race==1) then
            player:startEvent(0x0078);
        else
            player:messageSpecial(NO_NEED_INVESTIGATE); 
        end	
    else
        player:messageSpecial(NO_NEED_INVESTIGATE); 
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if (csid == 0x00CA) then
        player:setVar("PromathiaStatus",2);
    elseif (0x0078 and option ~=0) then -- Hume
        player:addTitle(WARRIOR_OF_THE_CRYSTAL);	
        player:setVar("PromathiaStatus",3);
        player:addKeyItem(LIGHT_OF_VAHZL); 
        player:messageSpecial(KEYITEM_OBTAINED,LIGHT_OF_VAHZL);	   
    end
end;