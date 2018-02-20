-----------------------------------
-- Area: Caedarva Mire
--  NPC: Nasheefa
-- Type: Alzadaal Undersea Ruins
-- !pos -440.998 0.107 -740.015 79
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Caedarva_Mire/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:getItemCount() == 1 and trade:hasItemQty(2185,1)) then -- Silver
        player:tradeComplete();
        player:startEvent(183);
    end

end;

function onTrigger(player,npc)

    if (player:getXPos() < -440) then
        player:startEvent(184);
    else
        player:startEvent(182);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 183) then
        player:setPos(-219.977,-4,474.522,64,72); -- To Alzadaal Undersea Ruins {R}
    end

end;