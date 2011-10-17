-----------------------------------
-- Area: Port Windurst
-- NPC: Hohbiba-Mubiba
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
player:showText(npc,HOHBIBAMUBIBA_SHOP_DIALOG);

stock = {0x429b,1440,1,		--Yew Wand
	 0x42a3,91,1,		--Bronze Rod
	 0x42c2,3642,1,		--Elm Staff
	 0x42c9,18422,1,	--Elm Pole

	 0x429a,340,2,		--Willow Wand
	 0x4282,4945,2,		--Bone Cudgel
	 0x42c1,584,2,		--Holly Staff
	 0x42c8,4669,2,		--Holly Pole

	 0x4299,47,3,		--Maple Wand
	 0x4280,66,3,		--Ash Club
	 0x4281,1600,3,		--Chestnut Club
	 0x42c0,58,3,		--Ash Staff
	 0x42c7,386,3,		--Ash Pole
	 0x4040,143,3}		--Bronze Dagger
 
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



