-----------------------------------
-- Area: Bastok Mines
-- NPC: Tibelda
-- Only sells when Bastok controlls Valdeaunia Region
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
    RegionOwner = GetRegionOwner(VALDEAUNIA);
    if (RegionOwner ~= BASTOK) then 
        player:showText(npc,TIBELDA_CLOSED_DIALOG);
    else
        player:showText(npc,TIBELDA_OPEN_DIALOG);
        stock = {
            0x111e,    29,   --Frost Turnip
            0x027e,   170    --Sage
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
