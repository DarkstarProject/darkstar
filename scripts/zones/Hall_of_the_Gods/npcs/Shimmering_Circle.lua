-----------------------------------
-- Area: Hall of the Gods
-- NPC:  Shimmering Circle
-- Lifts players up to the sky!
-- @pos 0 -20 147 251
-----------------------------------

require("scripts/globals/keyitems");
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
	
	if(player:getZPos() < 200) then
		if(player:getCurrentMission(ZILART) == THE_GATE_OF_THE_GODS and player:getVar("ZilartStatus") == 0) then
			player:startEvent(0x0003); -- First time.
		else
			player:startEvent(0x000a);
		end
	else
		player:startEvent(0x000b);
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
	
	if(csid == 0x0003) then
		player:setVar("ZilartStatus",1);
	end
	
end;