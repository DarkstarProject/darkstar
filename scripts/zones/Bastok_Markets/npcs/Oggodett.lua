-----------------------------------
-- Area: Bastok Markets
-- NPC: Oggodett
-- Only sells when Bastok controlls Aragoneu Region
--
-- Updated Aug-09-2013 by Zerahn, based on bgwiki and gamerescape
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    RegionOwner = GetRegionOwner(ARAGONEU);
    if (RegionOwner ~= BASTOK) then 
        player:showText(npc,OGGODETT_CLOSED_DIALOG);
    else
        player:showText(npc,OGGODETT_OPEN_DIALOG);

        stock = {
            0x0277,    36,   --Horo Flour
            0x0275,    44,   --Millioncorn
            0x113f,   114,   --Roasted Corn
            0x1199,    92,   --Sunflower Seeds
            0x0349,    36    --Yagudo Feather
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
