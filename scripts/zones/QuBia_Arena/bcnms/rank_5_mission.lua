-----------------------------------
-- Area: Qu'Bia Arena
-----------------------------------

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
                player:startEvent(0x7d02,1,1,1,instance:getTimeInside(),1,1,0);
        elseif(leavecode == 4) then
                player:startEvent(0x7d01);
        end
        
end;

function onEventUpdate(player,csid,option)
-- print("bc update csid "..csid.." and option "..option);
	if (csid == 0x7d02) then
		player:delStatusEffect(EFFECT_BATTLEFIELD);
end;
        
function onEventFinish(player,csid,option)
-- print("bc finish csid "..csid.." and option "..option);
        
	if(csid == 0x7d02) then
		if(player:hasKeyItem(NEW_FEIYIN_SEAL) == true) then
			player:addKeyItem(BURNT_SEAL);
			player:messageSpecial(KEYITEM_OBTAINED,BURNT_SEAL);
			player:setVar("MissionStatus",12);
			player:delKeyItem(NEW_FEIYIN_SEAL);
			SetServerVariable("[BF]Mission_5-1_Enter",0);
		end
        
end;
