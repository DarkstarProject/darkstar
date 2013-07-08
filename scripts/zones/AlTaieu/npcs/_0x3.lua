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

   if(player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY and player:getVar("PromathiaStatus")==6)then
   		SpawnMob(16912835,180):updateEnmity(player);   
		SpawnMob(16912836,180):updateEnmity(player);
		SpawnMob(16912837,180):updateEnmity(player);   
    elseif(player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY and player:getVar("PromathiaStatus")==7)then
        player:startEvent(0x00A3);
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
	

	if(csid == 0x00A3)then	
	    player:setVar("PromathiaStatus",8);
		player:setVar("Ru_aern_3-1KILL",0);
		player:setVar("Ru_aern_3-2KILL",0);
		player:setVar("Ru_aern_3-3KILL",0);
		player:setPos(-20,0,-355,192,0x22);
	end
	
end;