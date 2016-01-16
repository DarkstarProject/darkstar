-----------------------------------
-- Area: Windurst Waters
-- NPC:  Prestapiq
-- Only sells when Windurst controls Movalpolos
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
    RegionOwner = GetRegionOwner(MOVALPOLOS);
    if (RegionOwner ~= WINDURST) then 
        player:showText(npc,PRESTAPIQ_CLOSED_DIALOG);
    else
        player:showText(npc,PRESTAPIQ_OPEN_DIALOG);

        stock = {
            0x0280,    11,   --Copper Ore
            0x1162,   694,   --Coral Fungus
            0x1117,  4032,   --Danceshroom
            0x0672,  6500,   --Kopparnickel Ore
            0x142D,   736    --Movalpolos Water
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
