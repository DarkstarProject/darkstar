-----------------------------------
-- Area: Promyvion Dem
-- ??? map acquisition
-----------------------------------
package.loaded["scripts/zones/Promyvion-Dem/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Promyvion-Dem/TextIDs");
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;

function onTrade(player,npc,trade)
    if (trade:hasItemQty(1721,1) and trade:getItemCount() == 1 and player:hasKeyItem(MAP_OF_PROMYVION_DEM) == false) then
        player:addKeyItem(MAP_OF_PROMYVION_DEM);
        player:tradeComplete();
        player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_PROMYVION_DEM);
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end
end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end;