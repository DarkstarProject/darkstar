-----------------------------------
-- Area: Al Zahbi
--  NPC: Taten-Bilten
--  Guild Merchant NPC: Clothcraft Guild
-- !pos 71.598 -6.000 -56.930 48
-----------------------------------
package.loaded["scripts/zones/Al_Zahbi/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/zones/Al_Zahbi/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:sendGuild(60430,6,21,0)) then
        player:showText(npc,TATEN_BILTEN_SHOP_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

