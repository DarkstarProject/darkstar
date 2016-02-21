-----------------------------------
--  Area: Port Bastok
--  NPC: Khel Pahlhama
--  Linkshell merchant
--  @pos 21 -2 -20 240
-- Confirmed shop stock, August 2013
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,KHEL_PAHLHAMA_SHOP_DIALOG,513);

    stock = {
        0x0200,  8000,       --Linkshell
        0x3f9d,   375        --Pendant Compass
    }
    showShop(player, STATIC, stock);

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;
