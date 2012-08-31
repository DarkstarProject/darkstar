-----------------------------------
-- Area: Dynamis Bastok
-- Name: Dynamis Bastok
-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function OnBcnmRegister(player,instance)
	SetServerVariable("[DynaBastok]Boss_Trigger",0);
	SetServerVariable("[DynaBastok]Already_Killed",0);
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
 print("leave code "..leavecode);
	
	if(leavecode == 2 or leavecode == 3 or leavecode == 4) then
		player:setPos(116.000,0.994,-72.000,127,0xEA);
	end
	if(leavecode == 4) then
		player:setVar("dynaWait1Day",os.date("%j"));
	end
	
end;