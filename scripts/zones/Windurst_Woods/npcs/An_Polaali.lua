-----------------------------------
--	Area: Windurst Woods
--	NPC:  An Polaali
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

	if (player:hasKeyItem(126) == true) then
		player:startEvent(0x0197);
	elseif (player:getVar("CHASING_TALES_TRACK_BOOK") == 1) then
	    player:startEvent(0x0194); -- Neeed CS here
    		
    else    
	    player:startEvent(0x2c);
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
end;