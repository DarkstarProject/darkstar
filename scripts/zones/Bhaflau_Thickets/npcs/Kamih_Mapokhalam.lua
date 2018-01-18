-----------------------------------
-- Area: Bhaflau Thickets
-- NPC: Kamih Mapokhalam
-- 20 -30 597 z 52 
-----------------------------------
package.loaded["scripts/zones/Bhaflau_Thickets/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Bhaflau_Thickets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    count = trade:getItemCount();

    if (count == 1 and trade:hasItemQty(2185,1)) then -- Silver
        player:tradeComplete();
        player:startEvent(121);
    elseif (count == 3 and trade:hasItemQty(2186,3)) then -- Mythril
        if (player:hasKeyItem(MAP_OF_ALZADAAL_RUINS)) then
            player:startEvent(147); 
        else
            player:startEvent(146);
        end
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getZPos() < 597) then
        player:startEvent(120);
    else
        player:startEvent(122);
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
    
    if (csid == 121) then
        player:setPos(325.137,-3.999,-619.968,0,72); -- To Alzadaal Undersea Ruins G-8 {R}
    elseif (csid == 146) then
        player:tradeComplete();
        player:addKeyItem(MAP_OF_ALZADAAL_RUINS);
        player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_ALZADAAL_RUINS);
    end
    
end;