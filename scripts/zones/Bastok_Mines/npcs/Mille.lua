-----------------------------------
-- Area: Bastok_Mines
-- NPC: Mille
-- Only sells when Bastok controlls Norvallen Region
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
    RegionOwner = GetRegionOwner(NORVALLEN);
    if (RegionOwner ~= BASTOK) then
        player:showText(npc,MILLE_CLOSED_DIALOG);
    else
        player:showText(npc,MILLE_OPEN_DIALOG);

        stock = {
            0x02b0,  18,     --Arrowwood Log
            0x02ba,  88,     --Ash Log
            0x026a,  25,     --Blue Peas
            0x026d,  25      --Crying Mustard
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
