-----------------------------------
-- Area: Upper Jeuno
-- NPC: Antonia
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,ANTONIA_SHOP_DIALOG);

stock = {0x5400,100100, -- Arasy Sainti
     0x5432,100100, -- Arasy Knife
     0x5464,100100, -- Arasy Sword
     0x5496,100100, -- Arasy Claymore
     0x54C8,100100, -- Arasy Tabar
     0x5502,100100, -- Arasy Axe
     0x5534,100100, -- Arasy Scythe
     0x5569,100100, -- Arasy Lance
     0x5595,100100, -- Yoshikiri
     0x55C8,100100, -- Ashijiro no Tachi
     0x55FF,100100, -- Arasy Rod
     0x563A,100100, -- Arasy Staff
     0x566A,100100, -- Arasy Bow
     0x5677,100100, -- Arasy Gun
     0x5390,100100, -- Animator Z
     0x5391,100100} -- Arasy Sachet
 
showShop(player, STATIC, stock);
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

