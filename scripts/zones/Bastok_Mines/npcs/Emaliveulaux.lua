-----------------------------------
--      Area: Bastok Mines
--      NPC:  Emaliveulaux
--      Only sells when Bastok controls the Tavnazian Archipelago
--      Only available to those with CoP Ch. 4.1 or higher
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

RegionOwner = GetRegionOwner(TAVNAZIANARCH);
cop = 40; --player:getVar("chainsOfPromathiaMissions");

if (cop >= 40) then
        if (RegionOwner ~= BASTOK) then
                player:showText(npc,EMALIVEULAUX_CLOSED_DIALOG);
        else
                player:showText(npc,EMALIVEULAUX_OPEN_DIALOG);

                stock = {0x05f3,290,  --Apple Mint
                                 0x142c,1945, --Ground Wasabi
                                 0x426d,99,   --Lufaise Fly
                                 0x144b,233}  --Misareaux Parsley
                                 
                showShop(player,BASTOK,stock);
        end
else
        player:showText(npc,EMALIVEULAUX_COP_NOT_COMPLETED);
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

