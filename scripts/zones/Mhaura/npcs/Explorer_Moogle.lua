-----------------------------------
--	Area: Mhaura
--	NPC:  Explorer Moogle
--	Working 100%
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/teleports");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 

accept = 0;
event  = 0x014e;
	
	if (player:getGil() < 300)then
		accept = 1;
	end
	if (player:getMainLvl() < EXPLORER_MOOGLE_LEVELCAP) then
		event = event + 1;
	end
	player:startEvent(event,player:getZone(),0,accept);
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

	if (csid == 0x014e) then
		if (option == 1) then		
			toExplorerMoogle(player,231);
			player:delGil(300);
		elseif (option == 2) then	
			toExplorerMoogle(player,234);
			player:delGil(300);
		elseif (option == 3) then	
			toExplorerMoogle(player,240);
			player:delGil(300);
		elseif (option == 4) then	
			toExplorerMoogle(player,248);
			player:delGil(300);
		elseif (option == 5) then	
			toExplorerMoogle(player,249);
			player:delGil(300);
		end
	end
end;