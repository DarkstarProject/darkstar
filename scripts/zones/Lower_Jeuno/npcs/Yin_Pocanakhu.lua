-----------------------------------
-- Area: Lower Jeuno
-- NPC:  Yin Pocanakhu
-- Involved in Quest: Borghertz's Hands (1st quest only)
-- @zone 245
-- @pos 35 4 -43
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getVar("BorghertzHandsFirstTime") == 2) then
        player:startEvent(0x00dc);
    else
        player:startEvent(0x00d1);
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

    if (csid == 0x00dc and option == 0 and player:delGil(1000)) then
        player:startEvent(0x00dd);
        player:setVar("BorghertzHandsFirstTime",0);
        player:setVar("BorghertzCS",1);
    end

end;