-----------------------------------
-- Area: Windurst Waters
-- NPC:  Jourille
-- Only sells when Windurst controlls Ronfaure Region
-- Confirmed shop stock, August 2013
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    RegionOwner = GetRegionOwner(RONFAURE);
    if (RegionOwner ~= WINDURST) then 
        player:showText(npc,JOURILLE_CLOSED_DIALOG);
    else
        player:showText(npc,JOURILLE_OPEN_DIALOG);

        stock = {
            0x027F,   110,   --Chestnut
            0x1125,    29,   --San d'Orian Carrot
            0x0262,    55,   --San d'Orian Flour
            0x114F,    69,   --San d'Orian Grape
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
