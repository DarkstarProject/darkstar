-----------------------------------
-- Area: Selbina
-- NPC:  Explorer Moogle
-- 
-----------------------------------

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

teleport = 0;
currentZone = 248;
	
	if (player:getGil() < 300) then
		teleport = 1;
	end

	player:startEvent(0x46f,currentZone,0,teleport);	
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

	if (csid == 0x46f) then
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



