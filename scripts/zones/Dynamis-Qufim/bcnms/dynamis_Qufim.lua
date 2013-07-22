-----------------------------------
-- Area: dynamis_Qufim
-- Name: dynamis_Qufim
-----------------------------------



-- After registering the BCNM via bcnmRegister(bcnmid)
function OnBcnmRegister(player,instance)
	
	SetServerVariable("[DynaQufim]UniqueID",player:getDynamisUniqueID(1288));
	SetServerVariable("[DynaQufim]Boss_Trigger",0);
	SetServerVariable("[DynaQufim]Already_Received",0);
	
	
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function OnBcnmEnter(player,instance)
	
	player:setVar("DynamisID",GetServerVariable("[DynaQufim]UniqueID"));
	player:setVar("dynaWaitxDay",os.time());
	
end;

-- Leaving the Dynamis by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function OnBcnmLeave(player,instance,leavecode)
--print("leave code "..leavecode);
	
	if(leavecode == 2 or leavecode == 3 or leavecode == 4) then
	    player:setPos(18,-19,162,240, 126);
	end
	if(leavecode == 4) then
		SetServerVariable("[DynaQufim]UniqueID",0);
	end
	
end;