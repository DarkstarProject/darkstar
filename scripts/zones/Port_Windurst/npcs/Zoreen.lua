-----------------------------------
-- Area: Port Windurst
-- NPC: Zoreen
-- Regional Marchant NPC 
-- Only sells when Windurst controls Valdeaunia
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
    RegionOwner = GetRegionOwner(VALDEAUNIA);
    if (RegionOwner ~= WINDURST) then 
        player:showText(npc,ZOREEN_CLOSED_DIALOG);
    else
        player:showText(npc,ZOREEN_OPEN_DIALOG);

        stock = {
            0x111E,    29,   --Frost Turnip
            0x027e,   170    --Sage
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
