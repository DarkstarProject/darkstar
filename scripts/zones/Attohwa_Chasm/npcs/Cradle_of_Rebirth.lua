-----------------------------------
-- Area: Attohwa Chasm
--  NPC: Cradle_of_Rebirth
-----------------------------------
local ID = require("scripts/zones/Attohwa_Chasm/IDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
    -- Trade Flaxen Pouch
    if (trade:hasItemQty(1777,1) and trade:getItemCount() == 1) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 1778); -- Parradamo Stones
        else
            player:tradeComplete();
            player:addItem(1778);
            player:messageSpecial(ID.text.ITEM_OBTAINED, 1778); -- Parradamo Stones
        end
    end
end;

function onTrigger(player,npc)
    if (player:hasKeyItem(dsp.ki.MIMEO_JEWEL) == true) then
        player:delKeyItem(dsp.ki.MIMEO_JEWEL);
        player:messageSpecial(ID.text.KEYITEM_LOST,dsp.ki.MIMEO_JEWEL);
        player:addKeyItem(dsp.ki.MIMEO_FEATHER);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.MIMEO_FEATHER);
        player:addKeyItem(dsp.ki.SECOND_MIMEO_FEATHER);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.SECOND_MIMEO_FEATHER);
        player:addKeyItem(dsp.ki.THIRD_MIMEO_FEATHER);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.THIRD_MIMEO_FEATHER);
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;