-----------------------------------
-- Area: Port Bastok
-- NPC:  Bagnobrok
-- Only sells when Bastok controls Movalpolos
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
    RegionOwner = GetRegionOwner(MOVALPOLOS);

    if (RegionOwner ~= BASTOK) then 
        player:showText(npc,BAGNOBROK_CLOSED_DIALOG);
    else
        player:showText(npc,BAGNOBROK_OPEN_DIALOG);
        stock = {
            0x0280,    11,   --Copper Ore
            0x1162,   694,   --Coral Fungus
            0x1117,  4032,   --Danceshroom
            0x0672,  6500,   --Kopparnickel Ore
            0x142D,   736    --Movalpolos Water
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
