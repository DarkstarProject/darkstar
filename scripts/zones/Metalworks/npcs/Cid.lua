-----------------------------------
-- Area: Metalworks
-- NPC:  Cid
-- Starts & Finishes Quest: Cid's Secret, The Usual, Dark Puppet (start)
-- Involved in Mission: Bastok 7-1
-- @pos -12 -12 1 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if (player:getCurrentMission(BASTOK) == THE_CRYSTAL_LINE and player:getVar("MissionStatus") == 1) then
		if (trade:getItemQty(613,1) and trade:getItemCount() == 1) then
			player:startEvent(0x01fa);
		end
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local currentday = tonumber(os.date("%j"));
    
	local CidsSecret = player:getQuestStatus(BASTOK,CID_S_SECRET);
	local LetterKeyItem = player:hasKeyItem(UNFINISHED_LETTER);
	local currentMission = player:getCurrentMission(BASTOK);
	local currentCOPMission = player:getCurrentMission(COP);
	local UlmiaPath = player:getVar("COP_Ulmia_s_Path");
	local TenzenPath = player:getVar("COP_Tenzen_s_Path");
	local LouverancePath = player:getVar("COP_Louverance_s_Path");
	local TreePathAv=0;
	if (currentCOPMission == DAWN and player:getVar("PromathiaStatus")==3 and player:getVar("Promathia_kill_day")~=currentday and player:getVar("COP_tenzen_story")== 0 ) then
	       player:startEvent(0x0381); -- COP event 
	elseif (currentCOPMission == CALM_BEFORE_THE_STORM and player:hasKeyItem(LETTERS_FROM_ULMIA_AND_PRISHE) == false and player:getVar("COP_Dalham_KILL") == 2 and player:getVar("COP_Boggelmann_KILL") == 2 and player:getVar("Cryptonberry_Executor_KILL")==2) then
	        player:startEvent(0x037C); -- COP event 
    elseif (currentCOPMission == FIRE_IN_THE_EYES_OF_MEN and player:getVar("PromathiaStatus")==2 and player:getVar("Promathia_CID_timer")~=VanadielDayOfTheYear()) then
	        player:startEvent(0x037A); -- COP event    
    elseif (currentCOPMission == FIRE_IN_THE_EYES_OF_MEN and player:getVar("PromathiaStatus")==1) then
          	player:startEvent(0x0359); -- COP event
	elseif (currentCOPMission == ONE_TO_BE_FEARED and player:getVar("PromathiaStatus")==0) then
	        player:startEvent(0x0358); -- COP event
	elseif (currentCOPMission == THREE_PATHS and LouverancePath == 6 ) then
	        player:startEvent(0x0354); -- COP event
	elseif (currentCOPMission == THREE_PATHS and LouverancePath == 9 ) then	
	        if (TenzenPath==11 and UlmiaPath==8) then 
	           TreePathAv=6;    
			elseif (TenzenPath==11) then
			   TreePathAv=2;
			elseif (UlmiaPath==8) then
			   TreePathAv=4;
			else
               TreePathAv=1;		 
	        end
	        player:startEvent(0x0355,TreePathAv); -- COP event
	elseif (currentCOPMission == THREE_PATHS and TenzenPath == 10 ) then
	        if (UlmiaPath==8 and LouverancePath==10) then 
	           TreePathAv=5;    
			elseif (LouverancePath==10) then
			   TreePathAv=3;
			elseif (UlmiaPath==8) then
			   TreePathAv=4;
			else
               TreePathAv=1;		 
	        end
	        player:startEvent(0x0356,TreePathAv); -- COP event
	elseif (currentCOPMission == THREE_PATHS and UlmiaPath == 7 ) then
	        if (TenzenPath==11 and LouverancePath==10) then 
	           TreePathAv=3;    
			elseif (LouverancePath==10) then
			   TreePathAv=1;
			elseif (TenzenPath==11) then
			   TreePathAv=2;
			else
               TreePathAv=0;		 
	        end
	        player:startEvent(0x0357,TreePathAv); -- COP event
	elseif (currentCOPMission == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus") > 8) then
	        player:startEvent(0x0352); -- COP event
    elseif (currentCOPMission == THE_ENDURING_TUMULT_OF_WAR and player:getVar("PromathiaStatus")==1) then
	        player:startEvent(0x0351); -- COP event
	elseif (currentCOPMission == THE_CALL_OF_THE_WYRMKING and player:getVar("PromathiaStatus")==1) then
	        player:startEvent(0x034D); -- COP event
	elseif (currentCOPMission == THE_ROAD_FORKS and player:getVar("EMERALD_WATERS_Status")== 7 and player:getVar("MEMORIES_OF_A_MAIDEN_Status")== 12) then --two paths are finished ?
			player:startEvent(0x034F); -- COP event 3.3
	elseif (player:getMainJob() == 8 and player:getMainLvl() >= AF2_QUEST_LEVEL and 
	   player:getQuestStatus(BASTOK,DARK_LEGACY) == QUEST_COMPLETED and player:getQuestStatus(BASTOK,DARK_PUPPET) == QUEST_AVAILABLE) then
		player:startEvent(0x02f8); -- Start Quest "Dark Puppet"
	elseif (currentMission == GEOLOGICAL_SURVEY) then
		if (player:hasKeyItem(RED_ACIDITY_TESTER)) then
			player:startEvent(0x01f8);
		elseif (player:hasKeyItem(BLUE_ACIDITY_TESTER) == false) then
			player:startEvent(0x01f7);
		end
	elseif (currentMission == THE_CRYSTAL_LINE) then
		if (player:hasKeyItem(C_L_REPORTS)) then
			player:showText(npc,MISSION_DIALOG_CID_TO_AYAME);
		else
			player:startEvent(0x01f9);
		end
	elseif (currentMission == THE_FINAL_IMAGE and player:getVar("MissionStatus") == 0) then
		player:startEvent(0x02fb); -- Bastok Mission 7-1
	elseif (currentMission == THE_FINAL_IMAGE and player:getVar("MissionStatus") == 2) then
		player:startEvent(0x02fc); -- Bastok Mission 7-1 (with Ki)
	--Begin Cid's Secret
	elseif (player:getFameLevel(BASTOK) >= 4 and CidsSecret == QUEST_AVAILABLE) then
		player:startEvent(0x01fb);
	elseif (CidsSecret == QUEST_ACCEPTED and LetterKeyItem == false and player:getVar("CidsSecret_Event") == 1) then
		player:startEvent(0x01fc); --After talking to Hilda, Cid gives information on the item she needs
	elseif (CidsSecret == QUEST_ACCEPTED and LetterKeyItem == false) then
		player:startEvent(0x01f6); --Reminder dialogue from Cid if you have not spoken to Hilda
	elseif (CidsSecret == QUEST_ACCEPTED and LetterKeyItem) then
		player:startEvent(0x01fd);
	--End Cid's Secret
    else
        player:startEvent(0x01f4); -- Standard Dialogue
    end
	
end;

-- 0x01f7  0x01f8  0x01f9  0x01fa  0x01f4  0x01f6  0x02d0  0x01fb  0x01fc  0x01fd  0x025b  0x02f3  0x02f8  0x03f2  0x02fb  0x02fc 
-- 0x030c  0x030e  0x031b  0x031c  0x031d  0x031e  0x031f  0x035d  0x034e  0x0350  0x035e  0x035f  0x0353  0x035a  0x034d  0x034f 
-- 0x0351  0x0352  0x0354  0x0355  0x0356  0x0357  0x0358  0x0359  0x0364  0x0365  0x0373  0x0374  0x037a  0x037b  0x037c  0x037d 
-- 0x037e  0x037f  0x0381  0x0382

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
-- local currentday = tonumber(os.date("%j"));  


--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if (csid == 0x0381) then
			player:setVar("COP_tenzen_story",1);   
    elseif (csid == 0x037C) then
	        player:addKeyItem(LETTERS_FROM_ULMIA_AND_PRISHE);
	        player:messageSpecial(KEYITEM_OBTAINED,LETTERS_FROM_ULMIA_AND_PRISHE);
    elseif (csid == 0x037A) then
	        player:setVar("PromathiaStatus",0);
			player:setVar("Promathia_CID_timer",0);
			player:completeMission(COP,FIRE_IN_THE_EYES_OF_MEN);
            player:addMission(COP,CALM_BEFORE_THE_STORM);
    elseif (csid == 0x0359) then
	        player:setVar("PromathiaStatus",2);
			player:setVar("Promathia_CID_timer",VanadielDayOfTheYear());
    elseif (csid == 0x0357) then	      
		    player:setVar("COP_Ulmia_s_Path",8);
    elseif (csid == 0x0356) then	        
		    player:setVar("COP_Tenzen_s_Path",11);
    elseif (csid == 0x0355) then	       
			player:setVar("COP_Louverance_s_Path",10);
	elseif (csid == 0x0354) then
	        player:setVar("COP_Louverance_s_Path",7);		
    elseif (csid == 0x0352) then 
	 	    player:setVar("PromathiaStatus",0);
	        player:completeMission(COP,DESIRES_OF_EMPTINESS);
            player:addMission(COP,THREE_PATHS);
    elseif (csid == 0x0351) then 
            player:setVar("PromathiaStatus",2);
	    elseif (csid == 0x0358) then 
            player:setVar("PromathiaStatus",1);		
	elseif (csid == 0x034D) then
	        player:setVar("PromathiaStatus",0);
	        player:completeMission(COP,THE_CALL_OF_THE_WYRMKING);
            player:addMission(COP,A_VESSEL_WITHOUT_A_CAPTAIN);
	elseif (csid == 0x034F) then 
	        -- finishing mission 3.3 and all sub missions
			player:setVar("EMERALD_WATERS_Status",0);
			player:setVar("MEMORIES_OF_A_MAIDEN_Status",0);
	        player:completeMission(COP,THE_ROAD_FORKS);
			player:addMission(COP,DESCENDANTS_OF_A_LINE_LOST);
			player:completeMission(COP,DESCENDANTS_OF_A_LINE_LOST);
			player:addMission(COP,COMEDY_OF_ERRORS_ACT_I);
			player:completeMission(COP,COMEDY_OF_ERRORS_ACT_I);
			player:addMission(COP,TENDING_AGED_WOUNDS ); --starting 3.4 COP mission
	elseif (csid == 0x02f8) then
		player:addQuest(BASTOK,DARK_PUPPET);
		player:setVar("darkPuppetCS",1);
	elseif (csid == 0x01f7) then
		player:addKeyItem(BLUE_ACIDITY_TESTER);
		player:messageSpecial(KEYITEM_OBTAINED, BLUE_ACIDITY_TESTER);
	elseif (csid == 0x01f8 or csid == 0x02fc) then
		finishMissionTimeline(player,1,csid,option);
	elseif (csid == 0x01f9 and option == 0) then
		if (player:getVar("MissionStatus") == 0) then
			if (player:getFreeSlotsCount(0) >= 1) then
				crystal = math.random(4096,4103);
				player:addItem(crystal);
				player:messageSpecial(ITEM_OBTAINED, crystal);
				player:setVar("MissionStatus",1);
			else
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,crystal);
			end
		end
	elseif (csid == 0x01fa and option == 0) then
		player:tradeComplete();
		player:addKeyItem(C_L_REPORTS);
		player:messageSpecial(KEYITEM_OBTAINED, C_L_REPORTS);
	elseif (csid == 0x02fb) then
		player:setVar("MissionStatus",1);
    elseif (csid == 0x01fb) then
        player:addQuest(BASTOK,CID_S_SECRET);
    elseif (csid == 0x01fd) then
			if (player:getFreeSlotsCount(0) >= 1) then
				player:delKeyItem(UNFINISHED_LETTER);
				player:setVar("CidsSecret_Event",0);
				player:addItem(13570);
				player:messageSpecial(ITEM_OBTAINED,13570); -- Ram Mantle
				player:addFame(BASTOK,BAS_FAME*30);
				player:completeQuest(BASTOK,CID_S_SECRET);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13570);
		end
     end
	 -- complete chapter "tree path"
	 if (csid == 0x0355 or csid == 0x0356 or csid == 0x0357) then
	   if (player:getVar("COP_Tenzen_s_Path")==11 and player:getVar("COP_Ulmia_s_Path")==8 and player:getVar("COP_Louverance_s_Path")==10) then
	     player:completeMission(COP,THREE_PATHS);
	     player:addMission(COP,FOR_WHOM_THE_VERSE_IS_SUNG);
		 player:setVar("PromathiaStatus",0);
         end
	 end
	 
	 
	 
end;



