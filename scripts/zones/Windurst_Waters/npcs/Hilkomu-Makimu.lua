-----------------------------------
-- Area: Windurst Waters
-- NPC: Hilkomu-Makimu
-- Standard Merchant NPC
-- Working 100%
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
player:showText(npc,HIKOMUMAKIMU_SHOP_DIALOG);

stock = {0x12dd,23184,1, --Scroll of Poison II
		 0x12e7,12880,1, --Scroll of Bio II
		 0x12e1,4747,1,	 --Scroll of Poisonga

		 0x12bd,1191,2,	 --Scroll of Stonega
		 0x12c7,2143,2,	 --Scroll of Waterga
		 0x12b8,4239,2,	 --Scroll of Aeroga
		 0x12ae,7181,2,	 --Scroll of Firaga
		 0x12b3,10948,2, --Scroll of Blizzaga
		 0x12c2,15456,2, --Scroll of Thundaga
		 0x12fb,8280,2,	 --Scroll of Shock Spikes

		 0x12a0,5814,3,	 --Scroll of Stone II
		 0x12aa,8100,3,	 --Scroll of Water II
		 0x129b,12236,3, --Scroll of Aero II
		 0x1291,16928,3, --Scroll of Fire II
		 0x1296,22356,3, --Scroll of Blizzard II
		 0x12a5,28520,3} --Scroll of Thunder II
 
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



