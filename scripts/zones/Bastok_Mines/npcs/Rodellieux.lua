-----------------------------------
-- Area: Bastok_Mines
-- NPC: Rodellieux
-- Only sells when Bastok controlls Fauregandi Region
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");

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
    if (RegionOwner ~= BASTOK) then 
        player:showText(npc,RODELLIEUX_CLOSED_DIALOG);
    else
        player:showText(npc,RODELLIEUX_OPEN_DIALOG);
        stock = {
            0x11db,    90,   --Beaugreens
            0x110b,    39,   --Faerie Apple
            0x02b3,    54    --Maple Log
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
