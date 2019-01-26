-----------------------------------
-- Area: Konschtat Highlands
--  NPC: Stone Monument
--  Involved in quest "An Explorer's Footsteps"
-- !pos -102.355 7.981 253.706 108
-----------------------------------
local ID = require("scripts/zones/Konschtat_Highlands/IDs");
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(900);
end;

function onTrade(player,npc,trade)
    if (trade:getItemCount() == 1 and trade:hasItemQty(571,1)) then
        player:tradeComplete();
        player:addItem(570);
        player:messageSpecial(ID.text.ITEM_OBTAINED,570);
        player:setVar("anExplorer-CurrentTablet",0x00080);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;