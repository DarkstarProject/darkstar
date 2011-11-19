-----------------------------------
--	Area: Windurst Waters
--	NPC:  Ohruru
--	Starts & Finishes Repeatable Quest: Catch me if you can
--	Working 90%
--  Note: Animation for his "Cure" is not functioning. Unable to capture option 1, so if the user says no, he heals them anyways.
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");
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
	Catch = player:getQuestStatus(WINDURST,CATCH_IT_IF_YOU_CAN);		
	if (Catch == 0) then
		rand = math.random(1,2);
		if (rand == 1) then
			player:startEvent(0x00e6); -- Describes his status research 
		else
			player:startEvent(0x00fd); -- Recomends to become his patient
		end					
	elseif (Catch == 1 and player:hasStatusEffect(EFFECT_MUTE) == false and player:hasStatusEffect(EFFECT_BANE) == false and player:hasStatusEffect(EFFECT_PLAGUE) == false) then
		rand = math.random(1,2);
		if (rand == 1) then
			player:startEvent(0x00e6); -- Describes his status research 
		else
			player:startEvent(0x00fd); -- Recomends to become his patient
		end	
	elseif (Catch >= 1 and (player:hasStatusEffect(EFFECT_MUTE) == true or player:hasStatusEffect(EFFECT_BANE) == true or player:hasStatusEffect(EFFECT_PLAGUE) == true)) then
		player:startEvent(0x00f6); -- Offers to cure player
	elseif (Catch == 2) then
		player:startEvent(0x00ff); -- Conversation after at least one Cure
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
	if (csid == 0x00e6 or csid == 0x00fd) then
		player:addQuest(WINDURST,CATCH_IT_IF_YOU_CAN);
	elseif (csid == 0x00f6 and option == 0) then
		if (player:getQuestStatus(WINDURST,CATCH_IT_IF_YOU_CAN) == 1) then
			player:completeQuest(WINDURST,CATCH_IT_IF_YOU_CAN);
			player:addFame(WINDURST,WIN_FAME*100);
		else
			player:addFame(WINDURST,WIN_FAME*10);
		end			
		if (player:hasStatusEffect(EFFECT_MUTE) == true) then
			player:delStatusEffect(EFFECT_MUTE);
			player:addGil(GIL_RATE*1000);
			player:messageSpecial(GIL_OBTAINED,GIL_RATE*1000);
			
		elseif (player:hasStatusEffect(EFFECT_BANE) == true) then
			player:delStatusEffect(EFFECT_BANE);
			player:addGil(GIL_RATE*1200);
			player:messageSpecial(GIL_OBTAINED,GIL_RATE*1200);
		elseif (player:hasStatusEffect(EFFECT_PLAGUE) == true) then
			player:delStatusEffect(EFFECT_PLAGUE);
			player:addGil(GIL_RATE*1500);
			player:messageSpecial(GIL_OBTAINED,GIL_RATE*1500);
			reward = 1000;
		end
	end
end;



