-----------------------------------
-- Area: Bastok_Mines
-- NPC: Faustin
-- Only sells when Bastok controlls Ronfaure Region
-----------------------------------

require("scripts/globals/events/harvest_festivals");
require("scripts/globals/shop");
require("scripts/globals/conquest");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    onHalloweenTrade(player,trade,npc)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    RegionOwner = GetRegionOwner(RONFAURE);
    if (RegionOwner ~= BASTOK) then
        player:showText(npc,FAUSTIN_CLOSED_DIALOG);
    else
        player:showText(npc,FAUSTIN_OPEN_DIALOG);

        stock = {
            0x027F,   110,   --Chestnut
            0x1125,    29,   --San d'Orian Carrot
            0x0262,    55,    --San d'Orian Flour
            0x114F,    69   --San d'Orian Grape
        };
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
