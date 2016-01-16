-----------------------------------
--    Area: Ru'Lud Gardens
--    NPC:  Macchi Gazlitah
--    Standard Mechant NPC
-- Sells base items, then sells better items based 
-- on a gil amount of what has been already purchased
-- in a given timeframe.
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/RuLude_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
 -- TODO: The contents of her shop changes based on gil over time (resets on JP midnight)
 --          Right now only her first tier of stock is shown
 --          See WIKI for the shop tiers based on the amount sold
    player:showText(npc,MACCHI_GAZLITAH_SHOP_DIALOG1);

stock = {0x1647,100,  --Uleguerand Milk
         0x1634,250,  --Chalaimbille
         0x45f1,100,}  --Wormy Broth
         
         -- 0x1636,800,  --Cheese Sandwich
         -- 0x1661,3360,  --Bavarois
         -- 0x1656,1300, --Cream Puff
         -- 0x01cd,5000,  --Buffalo Milk Case
         -- 0x1420,1280, --Buffalo Meat
         -- 0x1272,31878,  --Enfire II
         -- 0x1273,30492, --Enblizzard II
         -- 0x1274,27968,  --Enaero II
         -- 0x1275,26112, --Enstone II
         -- 0x1276,25600, --Enthunder II   
         -- 0x1277,33000,  --Enwater II
         -- 0x12f2,150000}  --Refresh II
 
showShop(player, JEUNO, stock);
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



