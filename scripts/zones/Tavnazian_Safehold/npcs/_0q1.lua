-----------------------------------
-- Area: Tavnazian Safehold
-- NPC:  Sewer Entrance
-- @pos 28 -12 44 26
-----------------------------------
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/zones/Tavnazian_Safehold/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getCurrentMission(COP) == THE_LOST_CITY and player:getVar("PromathiaStatus") > 0) then
        player:startEvent(0x0067);    
        elseif (player:getCurrentMission(COP) == CHAINS_AND_BONDS and player:getVar("PromathiaStatus")==3) then
        player:startEvent(0x0074);
    elseif (player:getCurrentMission(COP) >= DISTANT_BELIEFS or hasCompletedMission(COP,THE_LAST_VERSE)) then
        player:startEvent(0x01f6);
    else
        --player:messageSpecial();
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

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    
    if (csid == 0x0067) then
        player:setVar("PromathiaStatus",0);
        player:completeMission(COP,THE_LOST_CITY);
        player:addMission(COP,DISTANT_BELIEFS);
    elseif (csid == 0x0074) then
        player:setVar("PromathiaStatus",4);
    elseif (csid == 0x01f6 and option == 1) then
        player:setPos(260.068,0,-283.568,190,27); -- To Phomiuna Aqueducts {R}
    end
  
end;
