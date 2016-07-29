-----------------------------------
-- Area: Port Bastok
-- NPC:  Dhen Tevryukoh
-- Only sells when Bastok controlls Elshimo Uplands
--   @zone 236
--   @pos 35 -2 2 
-- Confirmed shop stock, August 2013
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
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
    RegionOwner = GetRegionOwner(ELSHIMOUPLANDS);
    if (RegionOwner ~= BASTOK) then 
        player:showText(npc,DHENTEVRYUKOH_CLOSED_DIALOG);
    else
        player:showText(npc,DHENTEVRYUKOH_OPEN_DIALOG);

        stock = {
            0x0585,  1656,   --Cattleya
            0x0274,   239,   --Cinnamon
            0x1174,    73,   --Pamamas
            0x02D1,   147    --Rattan Lumber
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
