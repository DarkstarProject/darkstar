-----------------------------------
--	Area: Batok Markets
--	NPC: Mjoll
--	Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

player:showText(npc,MJOLL_SHOP_DIALOG);

stock = {0x43A9,16,1,	--Silver Arrow

		 0x43A6,3,2,	--Wooden Arrow

		 0x43A8,7,3,	--Iron Arrow
		 0x13CD,199,3,	--Scroll of Dark Threnoldy
		 0x13C7,1000,3}	--Scroll of Ice Threnoldy

showNationShop(player, BASTOK, stock);
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



