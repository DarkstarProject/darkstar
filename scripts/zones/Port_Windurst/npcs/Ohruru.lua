-----------------------------------
--	Area: Windurst Waters
--	NPC:  Ohruru
--	Starts & Finishes Repeatable Quest: Catch me if you can
--	Working 90%
--  Involved in Quest: Wonder Wands
--  Note: Animation for his "Cure" is not functioning. Unable to capture option 1, so if the user says no, he heals them anyways.
--  @zone = 240
--  @pos = -108 -5 94
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");
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
--	player:delQuest(WINDURST,CATCH_IT_IF_YOU_CAN); -- ======== FOR TESTING ONLY ==========-----
-- ======== FOR TESTING ONLY ==========-----	
--	if (player:getVar("QuestCatchItIfYouCan_var") == 0 and player:hasStatusEffect(EFFECT_MUTE) == false and player:hasStatusEffect(EFFECT_BANE) == false and player:hasStatusEffect(EFFECT_PLAGUE) == false) then
--		rand = math.random(1,3);
--		if (rand == 1) then
--			player:addStatusEffect(EFFECT_MUTE,0,0,100);
--		elseif (rand == 2) then
--			player:addStatusEffect(EFFECT_BANE,0,0,100);
--		elseif (rand == 3) then
--			player:addStatusEffect(EFFECT_PLAGUE,0,0,100);
--		end
--	end
-- ======== FOR TESTING ONLY ==========-----
	
	Catch = player:getQuestStatus(WINDURST,CATCH_IT_IF_YOU_CAN);	
	WonderWands = player:getQuestStatus(WINDURST,WONDER_WANDS);
	if (WonderWands == QUEST_ACCEPTED) then
		player:startEvent(0x0102,0,17053);
	elseif (Catch == 0) then
		prog = player:getVar("QuestCatchItIfYouCan_var");
		if (prog == 0) then
			player:startEvent(0x00e6); -- CATCH IT IF YOU CAN: Before Quest 1
			player:setVar("QuestCatchItIfYouCan_var",1);
		elseif (prog == 1) then
			player:startEvent(0x00fd); -- CATCH IT IF YOU CAN: Before Start
			player:setVar("QuestCatchItIfYouCan_var",2);
		elseif (prog == 2) then
			player:startEvent(0x00e7); -- CATCH IT IF YOU CAN: Before Quest 2
		end					

	elseif (Catch >= 1 and (player:hasStatusEffect(EFFECT_MUTE) == true or player:hasStatusEffect(EFFECT_BANE) == true or player:hasStatusEffect(EFFECT_PLAGUE) == true)) then
		player:startEvent(0x00f6); -- CATCH IT IF YOU CAN: Quest Turn In 1
	elseif (Catch >= 1 and player:needToZone()) then
		player:startEvent(0x00ff); -- CATCH IT IF YOU CAN: After Quest
	elseif (Catch == 1 and player:hasStatusEffect(EFFECT_MUTE) == false and player:hasStatusEffect(EFFECT_BANE) == false and player:hasStatusEffect(EFFECT_PLAGUE) == false) then
		rand = math.random(1,2);
		if (rand == 1) then
			player:startEvent(0x00f8); -- CATCH IT IF YOU CAN: During Quest 1
		else
			player:startEvent(0x00fb); -- CATCH IT IF YOU CAN: During Quest 2
		end	
	elseif (WonderWands == QUEST_COMPLETED) then
		player:startEvent(0x0109);
	else
		player:startEvent(0x00e6); -- STANDARD CONVERSATION
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
	if (csid == 0x00e7) then
		player:addQuest(WINDURST,CATCH_IT_IF_YOU_CAN);
	elseif (csid == 0x00f6 and option == 0) then
		player:needToZone(true);
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
		end
		
		player:setVar("QuestCatchItIfYouCan_var",0);	
		
		if (player:getQuestStatus(WINDURST,CATCH_IT_IF_YOU_CAN) == QUEST_ACCEPTED) then
			player:completeQuest(WINDURST,CATCH_IT_IF_YOU_CAN);
			player:addFame(WINDURST,WIN_FAME*75);
		else
			player:addFame(WINDURST,WIN_FAME*8);
		end	
	end
end;

