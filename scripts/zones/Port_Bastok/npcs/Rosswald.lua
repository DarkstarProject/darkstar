-----------------------------------
-- Area: Port Bastok
-- NPC: Rosswald
-- Only sells when Bastok controlls Zulkheim Region
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
    RegionOwner = GetRegionOwner(ZULKHEIM);
    if (RegionOwner ~= BASTOK) then 
        player:showText(npc,ROSSWALD_CLOSED_DIALOG);
    else
        player:showText(npc,ROSSWALD_OPEN_DIALOG);

        stock = {
            0x1114,    44,   --Giant Sheep Meat
            0x026E,    44,   --Dried Marjoram
            0x0262,    55,   --San d'Orian Flour
            0x0263,    36,   --Rye Flour
            0x0730,  1840,   --Semolina
            0x110E,    22,   --La Theine Cabbage
            0x111A,    55    --Selbina Milk
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
