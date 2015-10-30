-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Amaura
-- Involved in Quest: The Medicine Woman, To Cure a Cough
-- @zone 230
-- @pos -85 -6 89
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if (player:hasKeyItem(AMAURAS_FORMULA) == true) then
		if (trade:hasItemQty(920,1) == true and trade:hasItemQty(642,1) == true and trade:hasItemQty(846,1) == true and trade:getItemCount() == 3) then
			player:startEvent(0x027D);
		end
	end
		
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	medicineWoman = player:getQuestStatus(SANDORIA,THE_MEDICINE_WOMAN);
	toCureaCough = player:getQuestStatus(SANDORIA,TO_CURE_A_COUGH);
	
	if (medicineWoman == QUEST_ACCEPTED) then
		amaurasFormulaKI = player:hasKeyItem(AMAURAS_FORMULA);
		coldMedicine = player:hasKeyItem(COLD_MEDICINE);
		
		if (amaurasFormulaKI == false and coldMedicine == false) then
			player:startEvent(0x027C);
		else
			player:startEvent(0x0282);
		end		
	elseif (player:getVar("DiaryPage") == 3 or toCureaCough == QUEST_ACCEPTED) then
		if (player:hasKeyItem(THYME_MOSS) == false and player:hasKeyItem(COUGH_MEDICINE) == false) then 
			player:startEvent(0x0285); -- need thyme moss for cough med
		elseif (player:hasKeyItem(THYME_MOSS) == true) then
			player:startEvent(0x0286); -- receive cough med for Nenne
		end
	else
		player:startEvent(0x0282);
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

	if (csid == 0x027C and option == 0) then
		player:addKeyItem(AMAURAS_FORMULA);
		player:messageSpecial(KEYITEM_OBTAINED,AMAURAS_FORMULA);
	elseif (csid == 0x027D) then
		player:tradeComplete();
		player:delKeyItem(AMAURAS_FORMULA);
		player:addKeyItem(COLD_MEDICINE);
		player:messageSpecial(KEYITEM_OBTAINED,COLD_MEDICINE);
	elseif (csid == 0x0285) then 
		player:addQuest(SANDORIA,TO_CURE_A_COUGH);
	elseif (csid == 0x0286) then 
		player:delKeyItem(THYME_MOSS);
		player:addKeyItem(COUGH_MEDICINE);
		player:messageSpecial(KEYITEM_OBTAINED,COUGH_MEDICINE);
	end
	
end;