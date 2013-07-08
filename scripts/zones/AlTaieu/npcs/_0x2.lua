-----------------------------------
--  Area: Al'Taieu
--  NPC:  rubious crystal
--  @pos 
-----------------------------------
package.loaded["scripts/zones/AlTaieu/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/AlTaieu/TextIDs");
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

   if(player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY and player:getVar("PromathiaStatus")==4)then
   		SpawnMob(16912832,180):updateEnmity(player);   
		SpawnMob(16912833,180):updateEnmity(player);
		SpawnMob(16912834,180):updateEnmity(player);   
    elseif(player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY and player:getVar("PromathiaStatus")==5)then
        player:startEvent(0x00A2);
	end
		
	return 1;
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
	

	if(csid == 0x00A2)then	
	    player:setVar("PromathiaStatus",6);
		player:setVar("Ru_aern_2-1KILL",0);
		player:setVar("Ru_aern_2-2KILL",0);
		player:setVar("Ru_aern_2-3KILL",0);
	end
	
end;