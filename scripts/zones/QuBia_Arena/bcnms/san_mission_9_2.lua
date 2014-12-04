-----------------------------------
-- Area: Qu'Bia Arena
-- NPC:  San Mission Rank 9-2
-- @pos  206
-- Author: Vivitaru
-----------------------------------
package.loaded["scripts/zones/QuBia_Arena/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/QuBia_Arena/TextIDs");


function OnBcnmRegister(player,instance)
SetServerVariable("san_9_2_kills", 0);
end;


function OnBcnmEnter(player,instance)
end;


function OnBcnmLeave(player,instance,leavecode)
	if(leavecode == 2) then
		if (player:getCurrentMission(SANDORIA) == THE_HEIR_TO_THE_LIGHT) then
			player:setVar("MissionStatus", 5);
		end
		if (player:hasCompletedMission(player:getNation(),23)) then
			player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,4,1);
		else
			player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,4,0);
		end
	elseif(leavecode == 1) then
		player:startEvent(0x7d02);
	end
end;

function onEventUpdate(player,csid,option)
--print("bc update csid "..csid.." and option "..option);
end;

function onEventFinish(player,csid,option)
--print("bc finish csid "..csid.." and option "..option);
end;