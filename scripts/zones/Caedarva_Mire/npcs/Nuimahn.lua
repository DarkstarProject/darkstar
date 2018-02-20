-----------------------------------
-- Area: Caedarva Mire
--  NPC: Nuimahn
-- Type: Alzadaal Undersea Ruins
-- !pos  -380 0 -381 79
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Caedarva_Mire/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:getItemCount() == 1 and trade:hasItemQty(2185,1)) then
        player:tradeComplete();
        player:startEvent(203);
    end
end;

function onTrigger(player,npc)

    if (player:getZPos() < -281) then
        player:startEvent(204); -- leaving
    else
        player:startEvent(202); -- entering
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 203) then
        player:setPos(-515,-6.5,740,0,72);
    end
end;