-----------------------------------
-- Area: Pso'Xja
-- NPC:  Stone Gate
-----------------------------------
package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/PsoXja/TextIDs");
require("scripts/globals/keyitems");
-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc) 
    if((player:getCurrentMission(COP) == THE_ENDURING_TUMULT_OF_WAR and player:getVar("PromathiaStatus")==3))then
	player:startEvent(0x0002);
	elseif(player:hasCompletedMission(COP,THE_ENDURING_TUMULT_OF_WAR))then
	player:startEvent(0x0032);
	else
	player:messageSpecial(DOOR_LOCKED);
	end
  return 1;
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
   if(csid == 0x0002 and option == 1 )then
     player:setVar("PromathiaStatus",0);
     player:completeMission(COP,THE_ENDURING_TUMULT_OF_WAR);
	 player:addMission(COP,DESIRES_OF_EMPTINESS);
	 player:addKeyItem(LIGHT_OF_VAHZL);
	 player:messageSpecial(LIGHT_OF_VAHZL);
	 player:setPos(7,-1,-106,14,22); --tp to promy valhz
    elseif(csid == 0x0032 and option == 1)then
     player:setPos(7,-1,-106,14,22); --tp to promy valhz
   end   

end;