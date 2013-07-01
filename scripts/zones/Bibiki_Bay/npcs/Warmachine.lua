-----------------------------------
-- Area: Bibiki Bay
-- NPC:  Warmachine
-- 
-- @zone 04
-- @pos 
-----------------------------------
package.loaded["scripts/zones/Bibiki_Bay/TextIDs"] = nil;
-----------------------------------


require("scripts/globals/keyitems");
require("scripts/zones/Bibiki_Bay/TextIDs");
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

	
	-- COP mission
	if(player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Louverance_s_Path") == 2) then
	        player:startEvent(0x0021);		

	-- standard dialog
	else
		
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

	if(csid == 0x0021) then
        player:setVar("COP_Louverance_s_Path",3);	
	end

end;