-----------------------------------
-- Area: dynamis_Tavnazia
-- Name: dynamis_Tavnazia
-----------------------------------



-- After registering the BCNM via bcnmRegister(bcnmid)
function OnBcnmRegister(player,instance)

	SetServerVariable("[DynaTavnazia]UniqueID",player:getDynamisUniqueID(1289));
	SetServerVariable("[DynaTavnazia]Boss_Trigger",0);
	SetServerVariable("[DynaTavnazia]Already_Received",0);
	
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function OnBcnmEnter(player,instance)
	
	player:setVar("DynamisID",GetServerVariable("[DynaTavnazia]UniqueID"));
	player:setVar("dynaWaitxDay",os.time());
	
end;

-- Leaving the Dynamis by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function OnBcnmLeave(player,instance,leavecode)
--print("leave code "..leavecode);
	
	if(leavecode == 2 or leavecode == 3 or leavecode == 4) then
		player:setPos(0.1,-7,-23,195,26);
	end
	if(leavecode == 4) then
		SetServerVariable("[DynaTavnazia]UniqueID",0);
	end
	
end;