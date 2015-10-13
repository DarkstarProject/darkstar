-----------------------------------
--	Area: Windurst Woods
--	NPC:  Hae Jakkya
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

	chasingStatus = player:getQuestStatus(WINDURST,CHASING_TALES);
	if (player:hasKeyItem(126) ==true) then
		player:startEvent(0x0196);
	elseif (player:getVar("CHASING_TALES_TRACK_BOOK") == 1) then
	    player:startEvent(0x0193); 
		
	elseif (player:hasKeyItem(149)) then
	    player:startEvent(0x0192); -- Neeed CS here
		
	else	
	    player:startEvent(0x29);
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
	if (csid == 0x0192) then
		player:setVar("CHASING_TALES_TRACK_BOOK",1);
    end		
end;
