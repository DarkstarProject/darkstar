-----------------------------------
-- Area: Nashmau
-- NPC: Yoyoroon
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Nashmau/TextIDs");
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
    
player:showText(npc,YOYOROON_SHOP_DIALOG);

stock = {0x08BF,4940,        -- Tension Spring
     0x08C0,9925,        -- Inhibitor
     0x08C2,9925,        -- Mana Booster
     0x08C3,4940,        -- Loudspeaker
     0x08C6,4940,        -- Accelerator
     0x08C7,9925,        -- Scope
     0x08CA,9925,        -- Shock Absorber
     0x08CB,4940,        -- Armor Plate
     0x08CE,4940,        -- Stabilizer
     0x08CF,9925,        -- Volt Gun
     0x08D2,4940,        -- Mana Jammer
     0x08D4,9925,        -- Stealth Screen
     0x08D6,4940,        -- Auto-Repair Kit
     0x08D8,9925,        -- Damage Gauge
     0x08DA,4940,        -- Mana Tank
     0x08DC,9925}        -- Mana Conserver
 
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



