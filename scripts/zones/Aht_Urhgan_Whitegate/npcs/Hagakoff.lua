-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Hagakoff
-- Standard Merchant NPC
-- Partitionally Implemented
-- Difficult Shop Script needed
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
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
    
player:showText(npc,HAGAKOFF_SHOP_DIALOG);

stock = {0x400f,15448,        -- Katars (Not available if beastmen have the AC.)
     0x4010,67760,        -- Darksteel Katars
     0x4023,45760,        -- Patas (Not available if beastmen have the AC.)
     0x4040,156,        -- Bronze Dagger
     0x4042,2030,        -- Dagger
     0x40a7,776,        -- Sapara
     0x40a8,4525,        -- Scimitar
     0x40a9,38800,        -- Tulwar (Not available if beastmen have the AC.)
     0x4111,6600,        -- Tabar
     0x4112,124305,        -- Darksteel Tabar (Not available if beastmen have the AC.)
     0x4140,672,        -- Butterfly Axe
     0x4141,4550,        -- Greataxe (Not available if beastmen have the AC.)
     0x4180,344,        -- Bronze Zaghnal
     0x4182,12540,        -- Zaghnal (Not available if beastmen have the AC.)
     0x4280,72,            -- Ash Club
     0x4281,1740,        -- Chestnut Club (Not available if beastmen have the AC.)
     0x4753,238}        -- Angon
 
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



