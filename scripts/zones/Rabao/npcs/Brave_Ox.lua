-----------------------------------
-- Area: Rabao
-- NPC: Brave Ox
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/Rabao/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,BRAVEOX_SHOP_DIALOG);

stock = 
{
    0x122E,77350,    --Protect IV
    0x1280,73710,    --Protectra IV
    0x1304,63700,    --Dispel
    0x12FC,31850,    --Stun
    0x1270,31850,    --Flash
    0x128E,546000,    --Reraise III
    0x121E,78260,    --Banish III
    0x125D,20092,    --Cura
    0x125E,62192,    --Sacrifice
    0x125F,64584,    --Esuna
    0x1260,30967,    --Auspice
    0x1206,141137,    --Cure VI    (Not Implemented yet)
    0x122F,103882,    --Protect V    (Not Implemented yet)
    0x1234,125069    --Shell V    (Not Implemented yet)
}
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
