-----------------------------------
-- Area: Xarcabard
--  NPC: Telepoint
-- !pos 150.258 -21.047 -37.256 112
-----------------------------------
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Xarcabard/IDs");
-----------------------------------

function onTrade(player,npc,trade)

    item = trade:getItemId();

    if (trade:getItemCount() == 1 and item > 4095 and item < 4104) then
        if (player:getFreeSlotsCount() > 0 and player:hasItem(613) == false) then
            player:tradeComplete();
            player:addItem(613);
            player:messageSpecial(ID.text.ITEM_OBTAINED,613); -- Faded Crystal
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,613); -- Faded Crystal
        end
    end

end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.VAHZL_GATE_CRYSTAL) == false) then
        player:addKeyItem(dsp.ki.VAHZL_GATE_CRYSTAL);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.VAHZL_GATE_CRYSTAL);
    else
        player:messageSpecial(ID.text.ALREADY_OBTAINED_TELE);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;