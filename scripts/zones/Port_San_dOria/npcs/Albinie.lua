-----------------------------------
-- Area: Port San d'Oria
-- NPC: Albinie
-- Standard Merchant NPC
-- Working 100%
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,ALBINIE_SHOP_DIALOG);

stock = 
{
    0x02bb,5688,1, --Oak Log 
    0x0284,1800,1, --Mythril Ore 
    0x0343,225,1,  --Flax Flower
         
    0x02b6,2543,2, --Chestnut Log  
    0x0280,10,2,   --Copper Ore 
    0x0283,810,2,  --Iron Ore 
    0x0341,18,2,   --Moko Grass  
    0x11da,50,2,   --Bird Egg 
         
    0x02ba,86,3,   --Ash Log 
    0x0001,1800,3  --Chocobo Bedding 
}
showNationShop(player, SANDORIA, stock);
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



