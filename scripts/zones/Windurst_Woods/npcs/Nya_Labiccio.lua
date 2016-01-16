-----------------------------------
-- Area: Windurst Woods
-- NPC:  Nya Labiccio
-- Only sells when Windurst controlls Gustaberg Region
-- Confirmed shop stock, August 2013
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
require("scripts/zones/Windurst_Woods/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    RegionOwner = GetRegionOwner(GUSTABERG);
    if (RegionOwner ~= WINDURST) then 
        player:showText(npc,NYALABICCIO_CLOSED_DIALOG);
    else
        player:showText(npc,NYALABICCIO_OPEN_DIALOG);

        stock = {
            0x0454,   703,   --Sulfur
            0x026B,    43,   --Popoto
            0x0263,    36,   --Rye Flour
            0x1124,    40    --Eggplant
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
