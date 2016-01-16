-----------------------------------
-- Area: Selbina
-- NPC: Chutarmire
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
    
player:showText(npc,CHUTARMIRE_SHOP_DIALOG);

stock = {0x12A0,5751,    -- Scroll of Stone II
     0x12AA,8100,    -- Scroll of Water II
     0x129B,11970,    -- Scroll of Aero II
     0x1291,16560,    -- Scroll of Fire II
     0x1296,21870,    -- Scroll of Blizzard II
     0x12A5,27900,    -- Scroll of Thunder II
     0x12BD,1165,    -- Scroll of Stonega
     0x12C7,2097,    -- Scroll of Waterga
     0x12B8,4147,    -- Scroll of Aeroga
     0x12AE,7025,    -- Scroll of Firaga
     0x12B3,10710,    -- Scroll of Blizzaga
     0x12C2,15120,    -- Scroll of Thundaga
     0x12DD,22680,    -- Scroll of Poison II
     0x12E7,12600,    -- Scroll of Bio II
     0x12E1,4644,    -- Scroll of Poisonga
     0x12FB,8100}    -- Scroll of Shock Spikes
 
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



