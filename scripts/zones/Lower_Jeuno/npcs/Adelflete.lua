-----------------------------------
-- Area: Lower Jeuno
-- NPC: Adelflete
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,ADELFLETE_SHOP_DIALOG);

stock = {0x0326,1863, -- Tourmaline
         0x0327,1863, -- Sardonyx
         0x0320,1863, -- Amethyst
         0x032E,1863, -- Amber
         0x031B,1863, -- Lapis Lazuli
         0x0329,1863, -- Clear Topaz
         0x031F,1863, -- Onyx
         0x031C,1863, -- Light Opal
         0x340F,1250, -- Silver Earring
         0x3490,1250} -- Silver Ring
 
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



