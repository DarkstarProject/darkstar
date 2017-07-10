-----------------------------------
-- Area: Al Zahbi
--  NPC: Gajaad
-- Type: Donation Taker
-- @pos 40.781 -1.398 116.261 48
-----------------------------------
package.loaded["scripts/zones/Al_Zahbi/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Al_Zahbi/TextIDs")

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local walahraCoinCount = player:getVar("walahraCoinCount");
    local TradeCount = trade:getItemQty(2184);

    if (TradeCount > 0 and TradeCount == trade:getItemCount()) then
        if (walahraCoinCount + TradeCount >= 1000) then -- give player turban, donated over 1000
            if (player:addItem(15270)) then
                player:setVar("walahraCoinCount", walahraCoinCount - (1000 - TradeCount));
                player:tradeComplete();
                player:messageSpecial(ITEM_OBTAINED,15270);
                player:startEvent(0x0066, 2184, 0, TradeCount);
            else
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15270);
            end
        else -- turning in less than the amount needed to finish the quest
            if (TradeCount >= 100) then -- give bonus walahra water - only one water per trade, regardless of the amount.
                player:tradeComplete();
                player:setVar("walahraCoinCount", walahraCoinCount + TradeCount);
                player:addItem(5354);
                player:messageSpecial(ITEM_OBTAINED,5354);
                player:startEvent(0x0066, 2184, 0, TradeCount);
            else
                player:tradeComplete();
                player:setVar("walahraCoinCount", walahraCoinCount + TradeCount);
                player:startEvent(0x0066, 2184, 0, TradeCount);
            end
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    -- TODO besiege result can effect if this NPC will accept trades
    player:startEvent(0x0066, 2184);
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