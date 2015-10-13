-----------------------------------
-- Area: Ghelsba Outpost
-- Name: San d'Oria Mission 1-3 Save the children 
-- @pos -162 -11 78 140
-----------------------------------
package.loaded["scripts/zones/Ghelsba_Outpost/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Ghelsba_Outpost/TextIDs");

-----------------------------------

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
-- print(leave code ..leavecode);
	
	if (leavecode == 2) then --play end CS. Need time and battle id for record keeping + storage
		if (player:hasCompletedMission(SANDORIA,SAVE_THE_CHILDREN)) then
			player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,0,1);
		else
			player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,0,0);
		end
	elseif (leavecode == 4) then
		player:startEvent(0x7d02);
	end
	
end;

function onEventUpdate(player,csid,option)
-- print(bc update csid ..csid.. and option ..option);
end;
	
function onEventFinish(player,csid,option)
-- print(bc finish csid ..csid.. and option ..option);
	
	if (csid == 0x7d01 and option == 0 and player:getCurrentMission(SANDORIA) == SAVE_THE_CHILDREN and player:getVar("MissionStatus") == 2) then
		player:setTitle(FODDERCHIEF_FLAYER);
		player:addKeyItem(ORCISH_HUT_KEY);
		player:messageSpecial(KEYITEM_OBTAINED,ORCISH_HUT_KEY);
		player:setVar("MissionStatus",3);
	end
	
end;