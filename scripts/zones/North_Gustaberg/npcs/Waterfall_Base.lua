-----------------------------------
-- Area: North Gustaberg
--  NPC: Waterfall Base
-- Involved In Quest: Drachenfall
-- !pos -217.594 98.644 464.722 106
-----------------------------------
local ID = require("scripts/zones/North_Gustaberg/IDs")
-----------------------------------

function onTrade(player, npc, trade)
    local count = trade:getItemCount()
    local BrassCanteen = trade:hasItemQty(493, 1)

    if BrassCanteen == true and count == 1 then
        player:tradeComplete()
        player:addItem(492)
        player:messageSpecial(ID.text.ITEM_OBTAINED, 492)
    end
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.REACH_WATER_FROM_HERE)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end