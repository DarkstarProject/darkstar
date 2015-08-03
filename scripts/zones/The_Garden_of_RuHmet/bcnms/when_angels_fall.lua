-----------------------------------
-- Area: The_Garden_of_RuHmet
-- Name: when_angels_fall
-----------------------------------
package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/The_Garden_of_RuHmet/TextIDs");

-----------------------------------
-- EXAMPLE SCRIPT
-- 
-- What should go here:
-- giving key items, playing ENDING cutscenes
--
-- What should NOT go here:
-- Handling of "battlefield" status, spawning of monsters,
-- putting loot into treasure pool, 
-- enforcing ANY rules (SJ/number of people/etc), moving
-- chars around, playing entrance CSes (entrance CSes go in bcnm.lua)

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function onBcnmLeave(player,instance,leavecode)
	
	if (leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
	
		if (player:getCurrentMission(COP) == WHEN_ANGELS_FALL and player:getVar("PromathiaStatus")==4) then		         
		    player:startEvent(0x7d01,0,0,0,instance:getTimeInside(),0,0,0);			
            player:setVar("PromathiaStatus",5); 			
		else
			player:startEvent(0x7d01,0,0,0,instance:getTimeInside(),0,0,1); -- 
		end
	elseif (leavecode == 4) then
		player:startEvent(0x7d02);
	end
	--printf("leavecode: %u",leavecode);
	
end;

function onEventUpdate(player,csid,option)
-- print("bc update csid "..csid.." and option "..option);
end;
	
function onEventFinish(player,csid,option)
-- print("bc finish csid "..csid.." and option "..option);
  if (csid== 0x7d01) then
    player:setPos(420,0,445,192);
end
 
end;