-----------------------------------
-- Area: Port Windurst
-- NPC:  Alizabe
-- Only sells when Windurst controls the Tavnazian Archipelago
-- Only available to those with CoP Ch. 4.1 or higher
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
    RegionOwner = GetRegionOwner(TAVNAZIANARCH);
    cop = 40; --player:getVar("chainsOfPromathiaMissions");

    if (cop >= 40) then
        if (RegionOwner ~= WINDURST) then 
            player:showText(npc,ALIZABE_CLOSED_DIALOG);
        else
            player:showText(npc,ALIZABE_OPEN_DIALOG);

            stock = {
                0x05F3,   290,   --Apple Mint
                0x142C,  1945,   --Ground Wasabi
                0x426D,    99,   --Lufaise Fly
                0x144B,   233    --Misareaux Parsley
            }
            showShop(player,WINDURST,stock);
        end
    else
        player:showText(npc,ALIZABE_COP_NOT_COMPLETED);
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
