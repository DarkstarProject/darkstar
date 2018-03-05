-----------------------------------
-- Area: Promyvion holla
-- ??? map acquisition
-----------------------------------
package.loaded["scripts/zones/Promyvion-Holla/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Promyvion-Holla/TextIDs");
require("scripts/globals/settings");
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;

function onTrade(player,npc,trade)
    if (trade:hasItemQty(1720,1) and trade:getItemCount() == 1 and player:hasKeyItem(436)==false) then
        player:addKeyItem(436); --add map
        player:tradeComplete();
        player:messageSpecial(KEYITEM_OBTAINED,436);
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end
end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end;
