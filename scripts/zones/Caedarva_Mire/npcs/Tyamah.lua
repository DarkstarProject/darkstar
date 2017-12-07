-----------------------------------
-- Area: Caedarva Mire
-- NPC:  Tyamah
-- Type: Alzadaal Undersea Ruins
-- !pos 320.003 0.124 -700.011 79
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Caedarva_Mire/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:getItemCount() == 1 and trade:hasItemQty(2185,1)) then -- Silver
        player:tradeComplete();
        player:startEvent(163);
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getXPos() > 320) then
        player:startEvent(164);
    else
        player:startEvent(162);
    end

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

    if (csid == 163) then
        player:setPos(-20,-4,835,64,72);
    end

end;