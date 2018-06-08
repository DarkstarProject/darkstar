-----------------------------------
-- Area: Yhoator Jungle
--  NPC: Telepoint
-----------------------------------
package.loaded["scripts/zones/Yhoator_Jungle/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Yhoator_Jungle/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    local item = trade:getItemId();

    if (trade:getItemCount() == 1 and item > 4095 and item < 4104) then
        if (player:getFreeSlotsCount() > 0 and player:hasItem(613) == false) then
            player:tradeComplete();
            player:addItem(613);
            player:messageSpecial(ITEM_OBTAINED,613); -- Faded Crystal
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,613); -- Faded Crystal
        end
    end

end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.YHOATOR_GATE_CRYSTAL) == false) then
        player:addKeyItem(dsp.ki.YHOATOR_GATE_CRYSTAL);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.YHOATOR_GATE_CRYSTAL);
    else
        player:messageSpecial(ALREADY_OBTAINED_TELE);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;