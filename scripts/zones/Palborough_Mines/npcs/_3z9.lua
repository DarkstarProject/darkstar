-----------------------------------
-- Area: Palborough Mines
--  NPC: Refiner Lever
-- Involved In Mission: Journey Abroad
-- @zone 143
-- @pos 180 -32 167
-----------------------------------

require("scripts/globals/settings");
local text = require("scripts/zones/Palborough_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    refiner_output = player:getVar("refiner_output");

    if (refiner_output > 0 and player:getFreeSlotsCount() >= 1) then
        player:setVar("refiner_output",refiner_output - 1)
        player:messageSpecial(text.SOMETHING_FALLS_OUT_OF_THE_MACHINE);
        player:addItem(599);
        player:messageSpecial(text.ITEM_OBTAINED,599,1); 
    elseif (refiner_output > 0 and player:getFreeSlotsCount() == 0) then
        player:messageSpecial(text.YOU_CANT_CARRY_ANY_MORE_ITEMS);
    else
        player:messageSpecial(text.THE_MACHINE_SEEMS_TO_BE_WORKING);
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
end;