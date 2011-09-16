-----------------------------------
-- Area: Windurst Waters
-- NPC: Orez-Ebrez
-- Standard Merchant NPC
-- Working 100%
-----------------------------------

require("scripts/globals/shop");
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
	
player:showText(npc,OREZEBREZ_SHOP_DIALOG);

stock = {0x30b2,20000,1, --Red Cap
		 0x30aa,8972,1,	 --Soil Hachimaki
		 0x30a7,7026,1,	 --Beetle Mask

		 0x30b8,144,2,	 --Circlet
		 0x30b1,8024,2,	 --Cotton Headgear
		 0x3098,396,2,	 --Leather Bandana
		 0x30b9,1863,2,	 --Poet's Circlet
		 0x30d3,14400,2, --Flax Headband
		 0x30a9,3272,2,	 --Cotton Hachimaki
		 0x30a6,3520,2,	 --Bone Mask
		 0x30ba,10924,2, --Wool Hat

		 0x30b0,1742,3,	 --Headgear
		 0x30a8,552,3,	 --Hachimaki
		 0x30d2,1800,3,	 --Cotton Headband
		 0x30a0,151,3,	 --Bronze Cap
		 0x30a1,1471,3}	 --Brass Cap
 
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