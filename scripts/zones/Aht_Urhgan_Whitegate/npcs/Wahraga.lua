-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Wahraga
--  Guild Merchant: Alchemist Guild
-- !pos -76.836 -6.000 140.331 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:sendGuild(60425,8,23,5)) then
        player:showText(npc,WAHRAGA_SHOP_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

