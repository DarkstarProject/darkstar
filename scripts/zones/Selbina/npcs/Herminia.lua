-----------------------------------
-- Area: Selbina
-- NPC: Herminia
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Selbina/TextIDs");
require("scripts/globals/shop");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,HERMINIA_SHOP_DIALOG);

stock = {0x30A8,552,        -- Hachimaki
    0x3128,833,        -- Kenpogi
    0x3140,1274,        -- Tunic
    0x31A8,458,        -- Tekko
    0x31C0,596,        -- Mitts
    0x3228,666,        -- Sitabaki
    0x32A8,424,        -- Kyahan
    0x32C0,544}        -- Solea
 
showShop(player, STATIC, stock);
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