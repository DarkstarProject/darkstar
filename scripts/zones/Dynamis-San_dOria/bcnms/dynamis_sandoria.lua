-----------------------------------
-- Area: Dynamis San d'Oria
-- Name: Dynamis San d'Oria
-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function OnBcnmRegister(player,instance)
	
	SetServerVariable("[DynaSandoria]UniqueID",player:getDynamisUniqueID(1281));
	SetServerVariable("[DynaSandoria]Boss_Trigger",0);
	SetServerVariable("[DynaSandoria]Already_Received",0);
	
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function OnBcnmEnter(player,instance)
	
	player:setVar("DynamisID",GetServerVariable("[DynaSandoria]UniqueID"));
	player:setVar("dynaWaitxDay",os.time());
	
end;

-- Leaving the Dynamis by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function OnBcnmLeave(player,instance,leavecode)
--print("leave code "..leavecode);
	
	if(leavecode == 2 or leavecode == 3 or leavecode == 4) then
		player:setPos(161.000,-2.000,161.000,94,0xE6);
	end
	if(leavecode == 4) then
		GetNPCByID(17535224):setStatus(2);
		SetServerVariable("[DynaSandoria]UniqueID",0);
	end
	
end;