-----------------------------------
-- Area: Dynamis Xarcabard
-- Name: Dynamis Xarcabard
-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function OnBcnmRegister(player,instance)
	
	SetServerVariable("[DynaXarcabard]UniqueID",player:getDynamisUniqueID(1285));
	SetServerVariable("[DynaXarcabard]TE150_Trigger",0);
	SetServerVariable("[DynaXarcabard]Boss_Trigger",0);
	
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function OnBcnmEnter(player,instance)
	
	player:setVar("DynamisID",GetServerVariable("[DynaXarcabard]UniqueID"));
	player:setVar("dynaWaitxDay",os.time());
	
end;

-- Leaving the Dynamis by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function OnBcnmLeave(player,instance,leavecode)
--print("leave code "..leavecode);
	
	if(leavecode == 2 or leavecode == 3 or leavecode == 4) then
		player:setPos(569.312,-0.098,-270.158,90,0x70);
	end
	if(leavecode == 4) then
		GetNPCByID(17330778):setStatus(2);
		SetServerVariable("[DynaXarcabard]UniqueID",0);
	end
	
end;