-----------------------------------
-- Area: Port Bastok
-- NPC: Talib
-- Starts Quest: Beauty and the Galka
-- Starts & Finishes Quest: Shady Business
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

BeautyAndTheGalka = player:getQuestStatus(BASTOK,BEAUTY_AND_THE_GALKA);
ShadyBusiness     = player:getQuestStatus(BASTOK,SHADY_BUSINESS);

	if (ShadyBusiness >= QUEST_ACCEPTED) then
		count = trade:getItemCount();
		ZincOre = trade:hasItemQty(642,4);

		if (ZincOre == true and count == 4) then
			player:startEvent(0x005b);
		end
	elseif (BeautyAndTheGalka == QUEST_ACCEPTED) then
		count = trade:getItemCount();
		ZincOre = trade:hasItemQty(642,1);

		if (ZincOre == true and count == 1) then
			player:startEvent(0x0003);
		end
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

BeautyAndTheGalka       = player:getQuestStatus(BASTOK,BEAUTY_AND_THE_GALKA);
BeautyAndTheGalkaDenied = player:getVar("BeautyAndTheGalkaDenied");

	if (BeautyAndTheGalka == QUEST_COMPLETED) then
		player:startEvent(0x005a);		
	elseif (BeautyAndTheGalka == QUEST_ACCEPTED or BeautyAndTheGalkaDenied >= 1) then
		player:startEvent(0x0004);
	else 
		player:startEvent(0x0002);
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if (csid == 0x0002 and option == 0) then
		player:addQuest(BASTOK,BEAUTY_AND_THE_GALKA);
	elseif (csid == 0x0002 and option == 1) then
		player:setVar("BeautyAndTheGalkaDenied",1);
	elseif (csid == 0x0003) then
		player:tradeComplete();
		player:addKeyItem(2);
		player:messageSpecial(KEYITEM_OBTAINED,2);
	elseif (csid == 0x005a) then
		ShadyBusiness = player:getQuestStatus(BASTOK,SHADY_BUSINESS);
		
		if (ShadyBusiness == QUEST_AVAILABLE) then
			player:addQuest(BASTOK,SHADY_BUSINESS);
		end
	elseif (csid == 0x005b) then
		ShadyBusiness = player:getQuestStatus(BASTOK,SHADY_BUSINESS);
			
		if (ShadyBusiness == QUEST_ACCEPTED) then
			player:completeQuest(BASTOK,SHADY_BUSINESS);
			player:addFame(3,NORG_FAME*100);
		else
			player:addFame(3,NORG_FAME*8);
		end
		
		player:tradeComplete();
		player:addGil(GIL_RATE*350);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*350);
	end
	
end;



