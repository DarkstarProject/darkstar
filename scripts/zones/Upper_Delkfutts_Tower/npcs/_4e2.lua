-----------------------------------
-- Area: Upper Delkfutt's Tower
-- NPC:  Elevator
-- !pos -294 -143 27 158
-----------------------------------
package.loaded["scripts/zones/Upper_Delkfutts_Tower/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Upper_Delkfutts_Tower/TextIDs");
require("scripts/globals/keyitems");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(549,1) and trade:getItemCount() == 1) then -- Trade Delkfutt Key
        player:startEvent(6);
    end
end;

function onTrigger(player,npc)
    if (player:hasKeyItem(DELKFUTT_KEY)) then
        player:startEvent(6);
    else
        player:messageSpecial(THIS_ELEVATOR_GOES_DOWN);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 6) then
        if (player:hasKeyItem(DELKFUTT_KEY) == false) then
            player:tradeComplete();
            player:addKeyItem(DELKFUTT_KEY);
            player:messageSpecial(KEYITEM_OBTAINED,DELKFUTT_KEY);
        end
    end
end;
