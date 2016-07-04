-----------------------------------
-- Area: Nashmau
-- NPC: Mamaroon
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
    
player:showText(npc,MAMAROON_SHOP_DIALOG);

stock = 
{
    0x12FC,27000,  -- Scroll of Stun
    0x1264,5160,   -- Scroll of Enfire
    0x1265,4098,   -- Scroll of Enblizzard
    0x1266,2500,   -- Scroll of Enaero
    0x1267,2030,   -- Scroll of Entone
    0x1268,1515,   -- Scroll of Enthunder
    0x1269,7074,   -- Scroll of Enwater
    0x1262,100800, -- Scroll of Enlight
    0x12FB,9000,   -- Scroll of Shock Spikes
    0x09C5,29950,  -- Black Puppet Turban
    0x09C6,29950   -- White Puppet Turban
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



