-----------------------------------
-- Area: Windurst Waters
-- NPC:  Maqu Molpih
-- Only sells when Windurst controlls Aragoneu Region
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
    RegionOwner = GetRegionOwner(ARAGONEU);
    if (RegionOwner ~= WINDURST) then
        player:showText(npc,MAQUMOLPIH_CLOSED_DIALOG);
    else
        player:showText(npc,MAQUMOLPIH_OPEN_DIALOG);

        stock = {
            0x0277,    36,   --Horo Flour
            0x0275,    44,   --Millioncorn
            0x113F,   114,   --Roasted Corn
            0x1199,    92,   --Sunflower Seeds
            0x0349,    36    --Yagudo Feather
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
