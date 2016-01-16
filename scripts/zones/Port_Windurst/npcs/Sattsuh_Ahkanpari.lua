-----------------------------------
-- Area: Port Windurst
-- NPC: Sattsuh Ahkanpari
-- Regional Marchant NPC 
-- Only sells when Windurst controlls Elshimo Uplands
-- Confirmed shop stock, August 2013
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
require("scripts/zones/Port_Windurst/TextIDs");

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
    if (RegionOwner ~= WINDURST) then 
        player:showText(npc,SATTSUHAHKANPARI_CLOSED_DIALOG);
    else
        player:showText(npc,SATTSUHAHKANPARI_OPEN_DIALOG);

        stock = {
            0x0585,  1656,   --Cattleya
            0x0274,   239,   --Cinnamon
            0x1174,    73,   --Pamamas
            0x02d1,   147    --Rattan Lumber
        }
        showShop(player,WINDURST,stock);

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
