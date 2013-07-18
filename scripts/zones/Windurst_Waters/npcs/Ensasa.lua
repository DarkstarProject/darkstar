-----------------------------------
-- Area: Windurst Waters
-- NPC: Ensasa
-- Standard Merchant NPC
-- Working 100%
-----------------------------------

require("scripts/globals/harvest_festivals")
require("scripts/globals/shop");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	onHalloweenTrade(player,trade,npc);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
       
player:showText(npc,ENSASA_SHOP_DIALOG);

stock = {0x0068,3881,1, --Tarutaru Folding Screen

                 0x43b8,5,2,    --Crossbow Bolt
                 0x43a6,3,2,    --Wooden Arrow
                 0x0070,456,2,  --Yellow Jar

                 0x43a7,4,3,    --Bone Arrow
                 0x00da,920,3,  --Earthen Flowerpot
                 0x43f4,3,3,    --Little Worm
                 0x43f3,9,3,    --Lugworm
                 0x0762,576,3,  --River Foliage
                 0x13c9,283,3,  --Earth Threnody
                 0x13c6,644,3,  --Fire Threnody
                 0x0763,576,3,  --Sea Foliage
                 0x005c,905,3,  --Tarutaru Stool
                 0x006e,4744,3} --White Jar
 
showNationShop(player, WINDURST, stock);
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



