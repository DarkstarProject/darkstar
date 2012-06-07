-----------------------------------
--	Area: Norg
--	NPC:  Oaken door (Gilgamesh's room)
--	@pos 97 -7 -12 252
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	ZilartMission = player:getCurrentMission(ZILART);
	
	if(ZilartMission == WELCOME_TNORG) then
		player:startEvent(0x0002); -- Zilart Missions 2
	elseif(ZilartMission == ROMAEVE and player:getVar("ZilartStatus") <= 1) then
		player:startEvent(0x0003); -- Zilart Missions 9
	elseif(ZilartMission == THE_HALL_OF_THE_GODS) then 
		player:startEvent(0x00a9); -- Zilart Missions 11
	else
		player:startEvent(0x0005);
	end
	
	return 1;
	
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
	
	if(csid == 0x0002) then
		player:completeMission(ZILART,WELCOME_TNORG);
		player:addMission(ZILART,KAZAMS_CHIEFTAINESS);
	elseif(csid == 0x0003) then
		player:setVar("ZilartStatus",0);
		player:completeMission(ZILART,ROMAEVE);
		player:addMission(ZILART,THE_TEMPLE_OF_DESOLATION);
	elseif(csid == 0x00a9) then
		player:completeMission(ZILART,THE_HALL_OF_THE_GODS);
		player:addMission(ZILART,THE_MITHRA_AND_THE_CRYSTAL);
	end
	
end;