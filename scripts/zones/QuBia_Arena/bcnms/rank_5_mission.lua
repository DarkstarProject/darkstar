-----------------------------------
-- Area: Qu'Bia Arena
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/titles");

-- After registering the BCNM via bcnmRegister(bcnmid)
function OnBcnmRegister(player,instance)
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function OnBcnmEnter(player,instance)
end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function OnBcnmLeave(player,instance,leavecode)
-- print("leave code "..leavecode);
	if(leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
		if(player:hasKeyItem(NEW_FEIYIN_SEAL) == true) then
			player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,0,0);
		else -- Gives skip dialogue if previously completed
			player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,0,1);
		end
	elseif(leavecode == 4) then
		player:startEvent(0x7d02);
	end
end;

function onEventUpdate(player,csid,option)
-- print("bc update csid "..csid.." and option "..option);
	if (csid == 0x7d01) then
		player:delStatusEffect(EFFECT_BATTLEFIELD);
	end;
end;
        
function onEventFinish(player,csid,option)
-- print("bc finish csid "..csid.." and option "..option);
        
	if(csid == 0x7d01) then
		if(player:hasKeyItem(NEW_FEIYIN_SEAL) == true) then
			player:addKeyItem(BURNT_SEAL);
			player:messageSpecial(KEYITEM_OBTAINED,BURNT_SEAL);
			player:setVar("MissionStatus",12);
			player:delKeyItem(NEW_FEIYIN_SEAL);
		end;
		player:setTitle(ARCHMAGE_ASSASSIN);
	end;
end;
