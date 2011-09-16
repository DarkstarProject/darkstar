-----------------------------------
--	Area: Batok Markets
--	NPC: Zaira
--	Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
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

player:showText(npc,ZAIRA_SHOP_DIALOG);

stock = {0x12fe,111,1, 	--Scroll of Blind

		 0x12e6,360,2, 	--Scroll of Bio
		 0x12dc,82,2,	--Scroll of Poison
		 0x12fd,2250,2,	--Scroll of Sleep

		 0x129a,324,3,	--Scroll of Aero
		 0x1295,1584,3,	--Scroll of Blizzard
		 0x12eb,4644,3,	--Scroll of Burn
		 0x12ed,2250,3,	--Scroll of Choke
		 0x12f0,6366,3,	--Scroll of Drown
		 0x1290,837,3,	--Scroll of Fire
		 0x12ec,3688,3,	--Scroll of Frost
		 0x12ee,1827,3,	--Scroll of Rasp
		 0x12ef,1363,3,	--Scroll of Shock
		 0x11ff,61,3,	--Scroll of Stone
		 0x12a4,3261,3,	--Scroll of Thunder
		 0x12a9,140,3}	--Scroll of Water

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