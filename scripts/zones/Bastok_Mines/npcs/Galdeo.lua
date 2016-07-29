-----------------------------------
-- Area: Bastok Mines
-- NPC: Galdeo
-- Only sells when Bastok controlls Li'Telor Region
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
    RegionOwner = GetRegionOwner(LITELOR);
    if (RegionOwner ~= BASTOK) then 
        player:showText(npc,GALDEO_CLOSED_DIALOG);
    else
        player:showText(npc,GALDEO_OPEN_DIALOG);
        stock = {
            0x026f,   119,   --Bay Leaves
            0x103a,  6440    --Holy Water
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
