-----------------------------------
--
-- Zone: Beadeaux (147)
--
-----------------------------------

package.loaded["scripts/zones/Beadeaux/TextIDs"] = nil;
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Beadeaux/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
end;			

-----------------------------------			
-- onZoneIn			
-----------------------------------			

function onZoneIn(player,prevZone)			
	cs = -1;		
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then		
		player:setPos(387.382,38.029,19.694,3);	
	end		
	if (prevZone == 109) then		
		if (player:getQuestStatus(BASTOK, BLADE_OF_DARKNESS) == QUEST_ACCEPTED and player:getVar("Blade_of_Darkness_SwordKills") >= 100) then	
			cs = 0x0079;
		elseif (player:getCurrentMission(1) == 10 and player:getVar("MissionStatus") == 2) then	
			cs = 0x0078;
		elseif(player:getMainJob() == 8 and player:getQuestStatus(BASTOK,DARK_PUPPET) == QUEST_COMPLETED and player:getQuestStatus(BASTOK,BLADE_OF_EVIL) == QUEST_AVAILABLE) then	
			cs = 0x007a;
		end	
	end		
	return cs;		
end;			

-----------------------------------			
-- onRegionEnter			
-----------------------------------			

function onRegionEnter(player,region)			
end;			

-----------------------------------			
-- onEventUpdate			
-----------------------------------		

function onEventUpdate(player,csid,option)		
	-- printf("CSID: %u",csid);	
	-- printf("RESULT: %u",option);	
end;		

-----------------------------------		
-- onEventFinish		
-----------------------------------		

function onEventFinish(player,csid,option)		
	-- printf("CSID: %u",csid);	
	-- printf("RESULT: %u",option);	
	if (csid == 0x0079) then	
		player:unlockJob(8);
		player:setTitle(DARK_SIDER);
		player:setVar("ZeruhnMines_Zeid_CS", 0);
		player:setVar("Blade_of_Darkness_SwordKills", 0);
		player:completeQuest(BASTOK, BLADE_OF_DARKNESS);
		player:messageSpecial(YOU_CAN_NOW_BECOME_A_DARK_KNIGHT);
	elseif (csid == 0x0078) then	
		player:setVar("MissionStatus",2);
		player:setPos(-297, 1, 96, 1);
	elseif(csid == 0x007a) then	
		player:addQuest(BASTOK,BLADE_OF_EVIL);
	end	
end;		
