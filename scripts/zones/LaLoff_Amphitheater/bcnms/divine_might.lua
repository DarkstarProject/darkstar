-----------------------------------
-- Area: LaLoff Amphitheater
-- Name: Divine Might
-- 
-----------------------------------

-- Death cutscenes:

--	player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,0,0); -- Hume
--	player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,1,0); -- taru
--	player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,2,0); -- mithra	
--	player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,3,0); -- elvan	
--	player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,4,0); -- galka	
--	player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,5,0); -- divine might
--	player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,6,0); -- skip ending cs


-- After registering the BCNM via bcnmRegister(bcnmid)
function OnBcnmRegister(player,instance)
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function OnBcnmEnter(player,instance)
				player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,1,1);
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
	
		if(player:hasCompletedMission(ZILART,ARK_ANGELS)) then
			player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,6,1);		-- winning CS
		else
			player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,6,0);		-- winning CS (allow player to skip)
		end
		
	elseif(leavecode == 4) then
		player:startEvent(0x7d02);	-- player lost
	end
	
end;

function onEventUpdate(player,csid,option)
-- print("bc update csid "..csid.." and option "..option);
	
	if(csid == 0x7d01) then
		-- need to make door open
	end
end;
	
function onEventFinish(player,csid,option)
 -- print("bc finish csid "..csid.." and option "..option);
 
	if(csid == 0x7d01) then	-- this will not occur until door is fixed
		if (player:getVar("DivineMight") == 1) then
			player:setVar("DivineMight",2);
		end
	end
	
end;