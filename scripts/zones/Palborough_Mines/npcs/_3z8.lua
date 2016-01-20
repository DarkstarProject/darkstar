-----------------------------------
-- Area: Palborough Mines
-- NPC:  Refiner Lever
-- Involved In Mission: Journey Abroad
-- @zone 143
-- @pos 180 -32 167
-----------------------------------
package.loaded["scripts/zones/Palborough_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Palborough_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getVar("refiner_input") > 0) then
        player:startEvent(0x0011,1,1,1,1,1,1,1,1); -- machine is working, you hear the sound of metal hitting metal down below.
        refiner_output = player:getVar("refiner_output");
        player:setVar("refiner_output",refiner_output + player:getVar("refiner_input"));
        player:setVar("refiner_input",0)
    else  
        player:startEvent(0x0011); -- machine is working, but you cannot discern its purpose.
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