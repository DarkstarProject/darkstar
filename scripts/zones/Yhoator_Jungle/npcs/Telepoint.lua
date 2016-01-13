-----------------------------------
-- Area: Yhoator Jungle
--  NPC: Telepoint
-----------------------------------

require("scripts/globals/keyitems");
local text = require("scripts/zones/Yhoator_Jungle/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    local item = trade:getItem();

    if (trade:getItemCount() == 1 and item > 4095 and item < 4104) then    
        if (player:getFreeSlotsCount() > 0 and player:hasItem(613) == false) then
            player:tradeComplete();
            player:addItem(613);
            player:messageSpecial(text.ITEM_OBTAINED,613); -- Faded Crystal
        else
            player:messageSpecial(text.ITEM_CANNOT_BE_OBTAINED,613); -- Faded Crystal
        end
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:hasKeyItem(YHOATOR_GATE_CRYSTAL) == false) then
        player:addKeyItem(YHOATOR_GATE_CRYSTAL);
        player:messageSpecial(text.KEYITEM_OBTAINED,YHOATOR_GATE_CRYSTAL);
    else
        player:messageSpecial(text.ALREADY_OBTAINED_TELE);
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
end;