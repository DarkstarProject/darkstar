-----------------------------------
-- Area: Bastok Markets
-- NPC: Rothais
-- Involved in Quest: Gourmet
-----------------------------------

require("scripts/globals/quests");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

vanatime = VanadielHour();

	if (vanatime>=18 or vanatime<6) then
		player:startEvent(0x00cc);
	elseif (vanatime>=6 and vanatime<12) then
		player:startEvent(0x00cd);
	else
		player:startEvent(0x00ce);
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