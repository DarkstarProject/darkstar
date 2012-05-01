-----------------------------------
--	Area: Norg
--	NPC:  Oaken door (Gilgamesh's room)
--	@pos 97 -2 -12 252
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
	
	if(player:getCurrentMission(ZILART) == WELCOME_TNORG) then -- ZM2 (4?)
		player:startEvent(0x0002); -- Zilart Missions 2
	elseif(player:getCurrentMission(ZILART) == 18 and player:getVar("ZilartStatus") == 2) then -- ZM9 (18?)
		player:startEvent(0x0003); -- Zilart Missions 9
	end
	
	return 0;
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
	end
	
end;