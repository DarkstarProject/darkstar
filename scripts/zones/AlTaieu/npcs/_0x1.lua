-----------------------------------
--  Area: Al'Taieu
--  NPC:  rubious crystal
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

   if(player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY and player:getVar("PromathiaStatus")==2)then
   		SpawnMob(16912829,180):updateEnmity(player);   
		SpawnMob(16912830,180):updateEnmity(player);
		SpawnMob(16912831,180):updateEnmity(player);   
    elseif(player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY and player:getVar("PromathiaStatus")==3)then
        player:startEvent(0x00A1);
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
	

	if(csid == 0x00A1)then	
	    player:setVar("PromathiaStatus",4);
		player:setVar("Ru_aern_1-1KILL",0);
		player:setVar("Ru_aern_1-2KILL",0);
		player:setVar("Ru_aern_1-3KILL",0);
	end
	
end;