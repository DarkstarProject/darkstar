-----------------------------------
-- Area: Port Windurst
-- NPC: Sheia Pohrichamaha
-- Only sells when Windurst controlls Fauregandi Region
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
    RegionOwner = GetRegionOwner(FAUREGANDI);

    if (RegionOwner ~= WINDURST) then 
        player:showText(npc,SHEIAPOHRICHAMAHA_CLOSED_DIALOG);
    else
        player:showText(npc,SHEIAPOHRICHAMAHA_OPEN_DIALOG);

        stock = {
            0x11DB,    90,   --Beaugreens
            0x110B,    39,   --Faerie Apple
            0x02B3,    54    --Maple Log
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
