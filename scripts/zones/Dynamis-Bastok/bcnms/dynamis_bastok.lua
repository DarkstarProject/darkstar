-----------------------------------
-- Area: Dynamis Bastok
-- Name: Dynamis Bastok
-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function OnBcnmRegister(player,instance)
	
	SetServerVariable("[DynaBastok]UniqueID",player:getDynamisUniqueID(1280));
	SetServerVariable("[DynaBastok]Boss_Trigger",0);
	SetServerVariable("[DynaBastok]Already_Received",0);
	
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function OnBcnmEnter(player,instance)
	
	player:setVar("DynamisID",GetServerVariable("[DynaBastok]UniqueID"));
	player:setVar("dynaWaitxDay",os.time());
	
end;

-- Leaving the Dynamis by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function OnBcnmLeave(player,instance,leavecode)
--print("leave code "..leavecode);
	
	if(leavecode == 2 or leavecode == 3 or leavecode == 4) then
		player:setPos(116.000,0.994,-72.000,127,0xEA);
	end
	if(leavecode == 4) then
		GetNPCByID(17539323):setStatus(2);
		SetServerVariable("[DynaBastok]UniqueID",0);
	end
	
end;