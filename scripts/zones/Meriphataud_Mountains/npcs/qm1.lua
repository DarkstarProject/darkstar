-----------------------------------
-- Area: Meriphataud Mountains
--  NPC: qm1 (???)
-- Involved in Quest: The Holy Crest
-- !pos 641 -15 7 119
-----------------------------------
local ID = require("scripts/zones/Meriphataud_Mountains/IDs")
-----------------------------------

function onTrade(player, npc, trade)
    if trade:hasItemQty(1159, 1) and trade:getItemCount() == 1 then
        if (player:getVar("TheHolyCrest_Event") == 4) then
            player:startEvent(56)
        end
    end
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.NOTHING_FOUND)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 56 then
        player:tradeComplete()
        player:setVar("TheHolyCrest_Event", 5)
        player:startEvent(33)
    end
end