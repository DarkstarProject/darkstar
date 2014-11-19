-----------------------------------
-- Area: Dynamis Windurst
-- Name: Dynamis Windurst
-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function OnBcnmRegister(player,instance)
	
	SetServerVariable("[DynaWindurst]UniqueID",player:getDynamisUniqueID(1282));
	SetServerVariable("[DynaWindurst]Boss_Trigger",0);
	SetServerVariable("[DynaWindurst]Already_Received",0);
	
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function OnBcnmEnter(player,instance)
	
	player:setVar("DynamisID",GetServerVariable("[DynaWindurst]UniqueID"));
	player:setVar("dynaWaitxDay",os.time());
	
end;

-- Leaving the Dynamis by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function OnBcnmLeave(player,instance,leavecode)
--print("leave code "..leavecode);
	
	if(leavecode == 2 or leavecode == 3 or leavecode == 4) then
		player:setPos(-217.000,1.000,-119.000,94,0xEF);
	end
	if(leavecode == 4) then
		GetNPCByID(17543480):setStatus(2);
		SetServerVariable("[DynaWindurst]UniqueID",0);
	end
	
end;