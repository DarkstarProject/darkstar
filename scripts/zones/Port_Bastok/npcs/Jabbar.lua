-----------------------------------
-- Area: Port Bastok
-- NPC: Jabbar
-- Type: Tenshodo Merchant
-- Involved in Quests: Tenshodo Menbership
-- @zone 236
-- @pos -99 -2 24
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:getQuestStatus(JEUNO,TENSHODO_MEMBERSHIP) == QUEST_ACCEPTED and player:hasKeyItem(TENSHODO_APPLICATION_FORM) == false) then 
		-- CS NOT FOUND
		player:addKeyItem(TENSHODO_APPLICATION_FORM);
		player:messageSpecial(KEYITEM_OBTAINED,TENSHODO_APPLICATION_FORM);
	elseif(player:hasKeyItem(TENSHODO_MEMBERS_CARD) == true) then 
		player:messageSpecial(TENSHODO_SHOP_OPEN_DIALOG); -- Ah, one of our members. Welcome to the Tenshodo shop.
		stock = {4877,39270,	-- Absorb-AGI
				 4880,14070,	-- Absorb-CHR
				 4875,2250,		-- Absorb-DEX
				 4878,37800,	-- Absorb-INT
				 4879,14070,	-- Absorb-MND
				 4874,40740,	-- Absorb-STR
				 4876,41370,	-- Absorb-VIT
				 0704,96,		-- Bamboo Stick
				 1555,1061,		-- Coriander
				 1475,579,		-- Curry Powder
				 4937,1561,		-- Doton: Ichi
				 5164,2075,		-- Ground Wasabi
				 1590,536,		-- Holy Basil
				 4934,1561,		-- Huton: Ichi
				 4928,1561,		-- Katon: Ichi
				 1652,160,		-- Rice Vinegar
				 5236,224,		-- Shungiku
				 4943,1561,		-- Suiton: Ichi
				 0657,4690,		-- Tama-Hagane
				 1164,30,		-- Tsurara
				 1554,431}		-- Turmeric
		showShop(player, NORG, stock);
	else
		player:messageSpecial(NO_MEMBERSHIP_SHOP_DIALOG); -- I have nothing to sell you.
	end
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



