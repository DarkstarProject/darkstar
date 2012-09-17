-----------------------------------
-- Area: Dynamis Bastok
-- Name: Dynamis Bastok
-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function OnBcnmRegister(player,instance)
	
	SetServerVariable("[DynaSandoria]UniqueID",player:getDynamisUniqueID(1281));
	SetServerVariable("[DynaSandoria]Boss_Trigger",0);
	SetServerVariable("[DynaSandoria]Already_Received",0);
	
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function OnBcnmEnter(player,instance)
	
	player:setVar("DynaSandoriaID",GetServerVariable("[DynaSandoria]UniqueID"));
	player:setVar("dynaWait1Day",os.date("%j"));
	
end;

-- Leaving the Dynamis by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function OnBcnmLeave(player,instance,leavecode)
 print("leave code "..leavecode);
	
	if(leavecode == 2 or leavecode == 3 or leavecode == 4) then
		player:setPos(161.000,-2.000,161.000,94,0xE6);
	end
	if(leavecode == 4) then
		GetNPCByID(17535220):setStatus(2);
		player:setVar("DynaSandoriaID",0);
	end
	
end;