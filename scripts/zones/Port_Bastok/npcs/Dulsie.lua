-----------------------------------
-- Area: Port Bastok
--  NPC: Dulsie
-- Adventurer's Assistant
-- Working 100%
-------------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/settings");
require("scripts/zones/Port_Bastok/TextIDs");

function onTrade(player,npc,trade)

    if (trade:hasItemQty(0x218,1) and trade:getItemCount() == 1) then
        player:startEvent(8);
    end

end;

function onTrigger(player,npc)
    player:startEvent(7);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 8) then
        player:tradeComplete();
        player:addGil(GIL_RATE*50);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*50);
    end

end;