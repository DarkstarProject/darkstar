-----------------------------------
-- Area: Silver Sea route to Al Zahbi
--  NPC: Yahliq
-- Type: Guild Merchant: Fishing Guild
-- !pos 4.986 -2.101 -12.026 59
-----------------------------------
package.loaded["scripts/zones/Silver_Sea_route_to_Al_Zahbi/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/zones/Silver_Sea_route_to_Al_Zahbi/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:sendGuild(525,1,23,5)) then
        player:showText(npc,YAHLIQ_SHOP_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
