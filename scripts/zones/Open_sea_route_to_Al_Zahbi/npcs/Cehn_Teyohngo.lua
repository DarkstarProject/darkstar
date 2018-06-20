-----------------------------------
-- Area: Open sea route to Al Zahbi
--  NPC: Cehn Teyohngo
-- Guild Merchant NPC: Fishing Guild
-- @zone 4.986 -2.101 -12.026 46
-----------------------------------
package.loaded["scripts/zones/Open_sea_route_to_Al_Zahbi/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/zones/Open_sea_route_to_Al_Zahbi/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:sendGuild(522,1,23,5)) then
        player:showText(npc,CEHN_TEYOHNGO_SHOP_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

