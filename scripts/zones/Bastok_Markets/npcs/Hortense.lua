-----------------------------------
-- Area: Bastok Markets
-- NPC: Hortense
-- Standard Merchant NPC
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
	
player:showText(npc,HORTENSE_SHOP_DIALOG);

stock = {0x1370,64,3,		-- Scroll of Foe Requiem
	 0x1371,441,3,		-- Scroll of Foe Requiem II
	 0x1372,3960,3,		-- Scroll of Foe Requiem III
	 0x1373,6912,3,		-- Scroll of Foe Requiem IV
	 0x1376,47196,3,	-- Scroll of Foe Requiem VII
	 0x137a,37,3,		-- Scroll of Army's Paeon
	 0x137b,321,3,		-- Scroll of Army's Paeon II
	 0x137c,3240,3,		-- Scroll of Army's Paeon III
	 0x137d,5940,3,		-- Scroll of Army's Paeon IV
	 0x137f,48944,3,	-- Scroll of Army's Paeon VI
	 0x138a,21,3,		-- Scroll of Valor Minuet
	 0x138b,1101,3,		-- Scroll of Valor Minuet II
	 0x138c,5544,3}		-- Scroll of Valor Minuet III
 
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