-----------------------------------
-- Area: Palborough Mines
-- NPC:  Refiner Lid
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
    
    gravelQty = trade:getItemQty(597); -- Mine Gravel
    already_in = player:getVar("refiner_input");

    if (already_in + gravelQty > 10) then
        player:startEvent(0x0014);
    elseif (trade:getItemCount() == gravelQty) then
        player:tradeComplete();
        player:setVar("refiner_input",already_in + gravelQty);
        player:startEvent(0x0013,597,gravelQty);
    else
        player:startEvent(0x0015);
    end
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x0012);
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