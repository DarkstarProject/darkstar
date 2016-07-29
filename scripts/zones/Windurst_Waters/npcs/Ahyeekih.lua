-----------------------------------
-- Area: Windurst Waters
-- NPC:  Ahyeekih
-- Only sells when Windurst controls Kolshushu
-- Confirmed shop stock, August 2013
-----------------------------------

require("scripts/globals/events/harvest_festivals")
require("scripts/globals/shop");
require("scripts/globals/conquest");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    onHalloweenTrade(player,trade,npc);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    RegionOwner = GetRegionOwner(KOLSHUSHU);
    if (RegionOwner ~= WINDURST) then
        player:showText(npc,AHYEEKIH_CLOSED_DIALOG);
    else
        player:showText(npc,AHYEEKIH_OPEN_DIALOG);
       
        stock = {
            0x1197,   184,   --Buburimu Grape
            0x0460,  1620,   --Casablanca
            0x1107,   220,   --Dhalmel Meat
            0x0266,    72,   --Mhaura Garlic
            0x115D,    40    --Yagudo Cherry
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
