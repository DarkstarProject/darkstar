-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC:  Hadahda
--  Type: Standard NPC
--  @pos -112.029 -6.999 -66.114 50
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/quests");
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrigger Action
function onTrigger(player,npc)

-----------------------------------
-- Initialization
artsAndCrafts_EkhuPesshyadha = player:getVar("QUEST_ARTSANDCRAFTS_EKHUPESSHYADHA");
		artsAndCrafts_Zabahf = player:getVar("QUEST_ARTSANDCRAFTS_ZABAHF");
	  artsAndCrafts_Mathlouq = player:getVar("QUEST_ARTSANDCRAFTS_MATHLOUQ");
	   artsAndCrafts_Balakaf = player:getVar("QUEST_ARTSANDCRAFTS_BALAKAF");
	    artsAndCrafts_Matifa = player:getVar("QUEST_ARTSANDCRAFTS_MATIFA");
	   artsAndCrafts_Mhasbaf = player:getVar("QUEST_ARTSANDCRAFTS_MHASBAF");
	    artsAndCrafts_Qutiba = player:getVar("QUEST_ARTSANDCRAFTS_QUTIBA");
	  artsAndCrafts_Kindness = player:getVar("QUEST_ARTSANDCRAFTS_KINDNESS");
			   artsAndCrafts = player:getQuestStatus(AHT_URHGAN,ARTS_AND_CRAFTS);

	if (artsAndCrafts == 2 and artsAndCrafts_Kindness == 0) then
		player:showText(npc,HADAHDA_DIALOG + 50);
	elseif (artsAndCrafts == 2 and artsAndCrafts_Kindness == 1) then
		player:showText(npc,HADAHDA_DIALOG + 52);
	elseif (artsAndCrafts == 1 and artsAndCrafts_Zabahf == 1 and artsAndCrafts_Mathlouq == 1 and artsAndCrafts_EkhuPesshyadha == 1 and artsAndCrafts_Balakaf == 1 and
			artsAndCrafts_Matifa == 1 and artsAndCrafts_Mhasbaf == 1 and artsAndCrafts_Qutiba == 1) then
		player:startEvent(0x0205);
	elseif (artsAndCrafts == 1) then
		player:showText(npc,HADAHDA_DIALOG + 9);
	elseif (artsAndCrafts == 0) then
		player:startEvent(0x01FC);
	end
end;

-----------------------------------
-- onTrade Action
function onTrade(player,npc,trade)

		   bowlOfSutlac = 0x15C9; -- 5577
	imperialBronzePiece = 0x0888; -- 2184

		tradeChkG = trade:getGil();
			count = trade:getItemCount();
		tradeChk1 = trade:hasItemQty(bowlOfSutlac,1);
		slotCount = player:getFreeSlotCount(0);
	artsAndCrafts = player:getQuestStatus(6,1);

	if (tradeChkG == 0 and count == 1 and tradeChk1 and artsAndCrafts == 2) then
		player:tradeComplete();
		player:showText(npc,HADAHDA_DIALOG + 51);
		player:addItem(imperialBronzePiece);
		player:setVar("QUEST_ARTSANDCRAFTS_KINDNESS",1);
		player:messageSpecial(ITEM_OBTAINED,imperialBronzePiece);
	end
end;

-----------------------------------
-- onEventFinish Action
function onEventFinish(player,csid,option)
	if (csid == 0x01FC) then
		player:addQuest(AHT_URHGAN,ARTS_AND_CRAFTS);
	elseif (csid == 0x0205) then
		player:addItem(0x15C9); -- Bowl of Sutlac
		player:messageSpecial(ITEM_OBTAINED,0x15C9);
		player:setVar("QUEST_ARTSANDCRAFTS_ZABAHF",0);
		player:setVar("QUEST_ARTSANDCRAFTS_MATHLOUQ",0);
		player:setVar("QUEST_ARTSANDCRAFTS_EKHUPESSHYADHA",0);
		player:setVar("QUEST_ARTSANDCRAFTS_BALAKAF",0);
		player:setVar("QUEST_ARTSANDCRAFTS_MHASBAF",0);
		player:setVar("QUEST_ARTSANDCRAFTS_QUTIBA",0);
		player:completeQuest(AHT_URHGAN,ARTS_AND_CRAFTS);
	end
end;
