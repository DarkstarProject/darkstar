-----------------------------------
-- Area: Caedarva Mire
--  NPC: Kwadaaf
-- Type: Entry to Alzadaal Undersea Ruins
-- !pos -639.000 12.323 -260.000 79
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Caedarva_Mire/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:getItemCount() == 1 and trade:hasItemQty(2185,1)) then -- Silver
        player:tradeComplete();
        player:startEvent(223);
    end

end;

function onTrigger(player,npc)

    if (player:getXPos() < -639) then
        player:startEvent(222);
    else
        player:startEvent(224);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 223) then
        player:setPos(-235,-4,220,0,72);
    end

end;