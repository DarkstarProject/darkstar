-----------------------------------
--    Area: Metalworks
--    NPC:  Takiyah
--  Type: Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (GetRegionOwner(QUFIMISLAND) ~= BASTOK) then 
        player:showText(npc,TAKIYAH_CLOSED_DIALOG);
    else
        player:showText(npc,TAKIYAH_OPEN_DIALOG);
        
        stock = {0x03ba,4121}        -- Magic Pot Shard
        
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