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
    if(player:getCurrentMission(COP) == THE_ENDURING_TUMULT_OF_WAR and player:getVar("PromathiaStatus")==4) then
	player:startEvent(0x0002);
    elseif(player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==3)then
	player:startEvent(0x006A); --start floor 1 or 3
	elseif(player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==5)then
	player:startEvent(0x006D); --start floor 1 or 3 or 4
	elseif(player:hasCompletedMission(COP,DESIRES_OF_EMPTINESS) or (player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==7))then
	player:startEvent(0x0070); --start floor 1 or 3 or 4
	elseif(player:hasCompletedMission(COP,THE_ENDURING_TUMULT_OF_WAR)or player:hasCompletedMission(COP,THE_LAST_VERSE))then
	player:startEvent(0x0032); --start floor 1
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
	elseif(csid == 0x006A)then
	  if (option == 1)then--floor 1
	  player:setPos(7,-1,-106,14,22);
	  elseif(option == 2)then --floor 3
	  player:setPos(186,-1,-60,2,22);
	  end
	elseif(csid == 0x006D)then
	  if (option == 1)then--floor 1
	  player:setPos(7,-1,-106,14,22);
	  elseif(option == 2)then --floor 3
	  player:setPos(186,-1,-60,2,22);
	  elseif(option == 2)then --floor 4
	  player:setPos(416,-1,140,130,22);
	  end
	elseif(csid == 0x0070)then
	  if (option == 1)then--floor 1
	  player:setPos(7,-1,-106,14,22);
	  elseif(option == 2)then --floor 3
	  player:setPos(186,-1,-60,2,22);
	  elseif(option == 3)then --floor 4
	  player:setPos(416,-1,140,130,22);
	  elseif(option == 4)then --floor 5
	  player:setPos(-333,-1,140,251,22);
	  end
   end   

end;