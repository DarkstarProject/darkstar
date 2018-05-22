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
    if (player:hasKeyItem(dsp.ki.DELKFUTT_KEY)) then
        player:startEvent(6);
    else
        player:messageSpecial(THIS_ELEVATOR_GOES_DOWN);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 6) then
        if (player:hasKeyItem(dsp.ki.DELKFUTT_KEY) == false) then
            player:tradeComplete();
            player:addKeyItem(dsp.ki.DELKFUTT_KEY);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.DELKFUTT_KEY);
        end
    end
end;
