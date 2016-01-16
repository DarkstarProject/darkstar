-----------------------------------
-- Area: Port Windurst
-- NPC: Posso Ruhbini
-- Regional Marchant NPC 
-- Only sells when Windurst controlls Norvallen
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
    RegionOwner = GetRegionOwner(NORVALLEN);
    if (RegionOwner ~= WINDURST) then 
        player:showText(npc,POSSORUHBINI_CLOSED_DIALOG);
    else
        player:showText(npc,POSSORUHBINI_OPEN_DIALOG);

        stock = {
            0x02B0,    18,   --Arrowwood Log
            0x02BA,    87,   --Ash Log
            0x026A,    25,   --Blue Peas
            0x026D,    25    --Crying Mustard
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
