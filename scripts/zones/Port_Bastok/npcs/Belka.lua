-----------------------------------
-- Area: Port Bastok
-- NPC: Belka
-- Only sells when Bastok controlls Derfland Region
-- Confirmed shop stock, August 2013
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    RegionOwner = GetRegionOwner(DERFLAND);
    if (RegionOwner ~= BASTOK) then 
        player:showText(npc,BELKA_CLOSED_DIALOG);
    else
        player:showText(npc,BELKA_OPEN_DIALOG);
        stock = {
            0x1100,   128,   --Derfland Pear
            0x0269,   142,   --Ginger
            0x11C1,    62,   --Gysahl Greens
            0x0584,  1656,   --Olive Flower
            0x0279,    14,   --Olive Oil
            0x03B7,   110    --Wijnruit
        }
        showShop(player,BASTOK,stock);

    end

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
