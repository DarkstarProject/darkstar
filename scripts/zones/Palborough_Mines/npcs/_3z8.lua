-----------------------------------
-- Area: Palborough Mines
--  NPC: Refiner Lever
-- Involved In Mission: Journey Abroad
-- @zone 143
-- !pos 180 -32 167
-----------------------------------
package.loaded["scripts/zones/Palborough_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Palborough_Mines/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getVar("refiner_input") > 0) then
        player:startEvent(17,1,1,1,1,1,1,1,1); -- machine is working, you hear the sound of metal hitting metal down below.
        refiner_output = player:getVar("refiner_output");
        player:setVar("refiner_output",refiner_output + player:getVar("refiner_input"));
        player:setVar("refiner_input",0)
    else
        player:startEvent(17); -- machine is working, but you cannot discern its purpose.
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;