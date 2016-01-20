-----------------------------------
-- Area: Windurst_Woods
-- NPC: Bin Stejihna
-- Only sells when Windurst controlls Zulkheim Region
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
    RegionOwner = GetRegionOwner(ZULKHEIM);
    if (RegionOwner ~= WINDURST) then 
        player:showText(npc,BIN_STEJIHNA_CLOSED_DIALOG);
    else
        player:showText(npc,BIN_STEJIHNA_OPEN_DIALOG);

        rank = getNationRank(BASTOK);
        if (rank ~= 3) then
            table.insert(stock,0x0730); --Semolina
            table.insert(stock,1840);
        end

        stock = {
            0x0730,  1840,   --Semolina
            0x1114,    44,   --Giant Sheep Meat
            0x026E,    44,   --Dried Marjoram
            0x0262,    55,   --San d'Orian Flour
            0x0263,    36,   --Rye Flour
            0x110E,    22,   --La Theine Cabbage
            0x111A,    55    --Selbina Milk
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
