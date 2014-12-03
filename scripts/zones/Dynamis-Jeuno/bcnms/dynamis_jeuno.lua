-----------------------------------
-- Area: Dynamis Jeuno
-- Name: Dynamis Jeuno
-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function OnBcnmRegister(player,instance)
	
	SetServerVariable("[DynaJeuno]UniqueID",player:getDynamisUniqueID(1283));
	SetServerVariable("[DynaJeuno]Boss_Trigger",0);
	SetServerVariable("[DynaJeuno]Already_Received",0);
	
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function OnBcnmEnter(player,instance)
	
	player:setVar("DynamisID",GetServerVariable("[DynaJeuno]UniqueID"));
	player:setVar("dynaWaitxDay",os.time());
	
end;

-- Leaving the Dynamis by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function OnBcnmLeave(player,instance,leavecode)
--print("leave code "..leavecode);
	
	if(leavecode == 2 or leavecode == 3 or leavecode == 4) then
		player:setPos(48.930,10.002,-71.032,195,0xF3);
	end
	if(leavecode == 4) then
		GetNPCByID(17547510):setStatus(2);
		SetServerVariable("[DynaJeuno]UniqueID",0);
	end
	
end;