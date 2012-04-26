-----------------------------------
-- Area: Hall of the Gods
-- NPC:  Cermet Gate
-- Gives qualified players access to Ru'Aun Gardens.
-- @pos 0 -12 48 251
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

	if(player:hasKeyItem(CERULEAN_CRYSTAL) == true) then -- Need to be changed by false
		player:startEvent(0x0001);
	else
		if(player:getCurrentMission(ZILART) == THE_MITHRA_AND_THE_CRYSTAL) then
			player:startEvent(0x0004); -- Zilart CS.
		else
			player:startEvent(0x0002);
		end
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
	
	if(csid == 0x0004) then
		player:completeMission(ZILART,THE_MITHRA_AND_THE_CRYSTAL);
		player:addMission(ZILART,THE_GATE_OF_THE_GODS);
	end
	
end;