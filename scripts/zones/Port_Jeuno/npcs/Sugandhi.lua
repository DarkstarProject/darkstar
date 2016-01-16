-----------------------------------
-- Area: Port Bastok
-- NPC: Sugandhi
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,SUGANDHI_SHOP_DIALOG);

stock = {0x4059,5589,1,        -- Kukri
     0x40A1,21067,1,        -- Broadsword
     0x4081,11588,1,        -- Tuck
     0x40AE,61200,1,        -- Falchion

     0x4052,2181,2,        -- Knife
     0x4099,30960,2,        -- Mythril Sword
     0x40A8,4072,2,        -- Scimitar

     0x4051,147,3,        -- Bronze Knife
     0x4015,104,3,        -- Cat Baghnakhs
     0x4097,241,3,        -- Bronze Sword
     0x4098,7128,3,        -- Iron Sword
     0x4085,9201,3,        -- Degen
     0x40A7,698,3}        -- Sapara
 
showNationShop(player, BASTOK, stock);
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



