-----------------------------------
-- Area: Tavnazian Safehold
-- NPC:  Despachiaire
-- @pos 108 -40 -83 26
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
	
	if(player:getCurrentMission(COP) == THE_LOST_CITY and player:getVar("PromathiaStatus") == 0)then
		player:startEvent(0x0066);
	elseif(player:getCurrentMission(COP) == SHELTERING_DOUBT and player:getVar("PromathiaStatus") == 0)then	
		player:startEvent(0x006C);
	else
		player:startEvent(0x006A);
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
  
	if(csid == 0x0066 or csid == 0x006C)then
		player:setVar("PromathiaStatus",1);
	end
  
end;