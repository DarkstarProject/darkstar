-----------------------------------
-- Area: Bibiki Bay
-- NPC:  Warmachine
-- @zone 4
-- @pos -345.236 -3.188 -976.563 4
-----------------------------------
package.loaded["scripts/zones/Bibiki_Bay/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Bibiki_Bay/TextIDs");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

local ColoredDrop = 4258+math.random(0,7);
    
    -- COP mission
    if (player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Louverance_s_Path") == 2) then
        player:startEvent(0x0021);        
    elseif (player:getCurrentMission(COP) == DAWN and player:getVar("COP_3-taru_story")== 1) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ColoredDrop);
        else
            player:setVar("ColoredDrop",ColoredDrop);
            player:startEvent(0x002B);
        end
    -- standard dialog
    else
        
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

    if (csid == 0x0021) then
        player:setVar("COP_Louverance_s_Path",3);    
    elseif (csid == 0x002B) then
        local ColoredDropID=player:getVar("ColoredDrop");                     
        player:addItem(ColoredDropID);
        player:messageSpecial(ITEM_OBTAINED,ColoredDropID);
        player:setVar("COP_3-taru_story",2);
        player:setVar("ColoredDrop",0);    
    end
    
end;