-----------------------------------
-- Area: Windurst_Woods
-- NPC:  Millerovieunet
-- Only sells when Windurst controlls Qufim Region
-- Confirmed shop stock, August 2013
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/events/harvest_festivals")
require("scripts/globals/shop");
require("scripts/globals/conquest");
require("scripts/zones/Windurst_Woods/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    onHalloweenTrade(player,trade,npc);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (GetRegionOwner(QUFIMISLAND) ~= WINDURST) then
        player:showText(npc,MILLEROVIEUNET_CLOSED_DIALOG);
    else
        player:showText(npc,MILLEROVIEUNET_OPEN_DIALOG);

        stock = {
            0x03BA,  4032    --Magic Pot Shard
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
