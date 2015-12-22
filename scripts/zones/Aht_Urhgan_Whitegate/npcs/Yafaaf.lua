-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC:  Yafaaf
--  Type: Standard Merchant
--  @pos 76.889 -7 -140.379 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc, YAFAAF_SHOP_DIALOG);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

