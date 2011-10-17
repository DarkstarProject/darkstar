-----------------------------------
-- Area: Windurst Woods
-- NPC: Mono Nchaa
-- Standard Merchant NPC
-- Working 100%
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
require("scripts/zones/Windurst_Woods/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
player:showText(npc,MONONCHAA_SHOP_DIALOG);

stock = {0x43a6,3,2,	--Wooden Arrow
		 0x439c,55,2,	--Hawkeye
		 0x4340,165,2,	--Light Crossbow

		 0x43a7,4,3,	--Bone Arrow
		 0x43b8,5,3,	--Crossbow Bolt
		 0x1391,2649,3}	--Scroll of Hunter's Prelude
 
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



