-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Rubahah
-- Standard Merchant NPC
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
    local stock =
    {
        629,  48, -- Millioncorn
        2237, 60, -- Imperial Flour (available only if AC is in the Al Zahbi)
        2214, 68, -- Imperial Rice (available only if AC is in the Al Zahbi)
        2271, 316 -- Coffee Beans (available only if AC is in the Al Zahbi)
    }
    showShop(player, STATIC, stock);
    player:showText(npc,RUBAHAH_SHOP_DIALOG);
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