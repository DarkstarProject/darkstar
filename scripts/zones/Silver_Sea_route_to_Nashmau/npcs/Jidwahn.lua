-----------------------------------
-- Area: Silver Sea route to Nashmau
--  NPC: Jidwahn
-- Guild Merchant NPC: Fishing Guild
-- !pos 4.986 -2.101 -12.026 58
-----------------------------------
package.loaded["scripts/zones/Silver_Sea_route_to_Nashmau/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/zones/Silver_Sea_route_to_Nashmau/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:sendGuild(524,1,23,5)) then
        player:showText(npc,JIDWAHN_SHOP_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

