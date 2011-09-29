-----------------------------------
--	Area: Zeruhn Mines
--	NPC:  Lasthenes
--	Working 100%
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:getXPos() > -79.5 ) then
		player:startEvent(0x00B4);
	else
		player:startEvent(0x00B5);
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

	if (csid == 0x00B4) then
		player:setPos(-84, 0, 20, 129);
	elseif (csid == 0x00B5) then
		player:setPos(-74, 0, 20, 0);
	end
end;