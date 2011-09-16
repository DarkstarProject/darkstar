-----------------------------------
--	Area: Windurst Waters
--	NPC: Taajiji
--	Standard Merchant NPC
--	Working 100%
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
	
player:showText(npc,TAAJIJI_SHOP_DIALOG);

stock = {0x113b,756,1,	 --Dhalmel Pie
		 0x1152,5050,1,	 --Mushroom Risotto
		 0x11ca,12762,1, --Shallops Tropicale
		 0x1129,984,1,	 --Orange Kuchen

		 0x119a,5216,2,	 --Mutton Tortilla
		 0x1158,6064,2,	 --Whitefish Stew
		 0x11dc,1669,2,	 --Beaugreen Sautee
		 0x1146,184,2,	 --Orange Juice
		 0x1156,1324,2,	 --Dhalmel Steak

		 0x1138,128,3,	 --Tortilla
		 0x118c,552,3,	 --Puls
		 0x1151,2387,3,	 --Dhalmel Stew
		 0x119d,10,3,	 --Distilled Water
		 0x118d,184,3,	 --Windurstian Tea
		 0x11cb,1711,3}	 --Windurst Salad
 
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