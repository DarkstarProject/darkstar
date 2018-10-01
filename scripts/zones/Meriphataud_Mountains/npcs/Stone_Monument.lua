-----------------------------------
-- Area: Meriphataud Mountains
--  NPC: Stone Monument
--  Involved in quest "An Explorer's Footsteps"
-- !pos 450.741 2.110 -290.736 119
-----------------------------------
local ID = require("scripts/zones/Meriphataud_Mountains/IDs");
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(900);
end;

function onTrade(player,npc,trade)
    if (trade:getItemCount() == 1 and trade:hasItemQty(571,1)) then
        player:tradeComplete();
        player:addItem(570);
        player:messageSpecial(ID.text.ITEM_OBTAINED,570);
        player:setVar("anExplorer-CurrentTablet",0x04000);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;