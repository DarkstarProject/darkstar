-----------------------------------
-- Area: Bastok Mines
-- NPC: Aulavia
-- Regional Marchant NPC
-- Only sells when Bastok controls Vollbow.
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
    RegionOwner = GetRegionOwner(VOLLBOW);

    if (RegionOwner ~= BASTOK) then
        player:showText(npc,AULAVIA_CLOSED_DIALOG);
    else
        player:showText(npc,AULAVIA_OPEN_DIALOG);
        stock = {
            0x27c,   119,    --Chamomile
            0x360,    88,    --Fish Scales
            0x3a8,    14,    --Rock Salt
            0x582,  1656     --Sweet William
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
