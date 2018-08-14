-----------------------------------
-- Area: Promyvion holla
-- ??? map acquisition
-----------------------------------
package.loaded["scripts/zones/Promyvion-Holla/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Promyvion-Holla/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems")
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;

function onTrade(player,npc,trade)
    if (trade:hasItemQty(1720,1) and trade:getItemCount() == 1 and player:hasKeyItem(dsp.ki.MAP_OF_PROMYVION_HOLLA)==false) then
        player:addKeyItem(dsp.ki.MAP_OF_PROMYVION_HOLLA); --add map
        player:tradeComplete();
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.MAP_OF_PROMYVION_HOLLA);
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end
end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end;
