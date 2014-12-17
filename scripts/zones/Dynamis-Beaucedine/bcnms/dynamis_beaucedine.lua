-----------------------------------
-- Area: Dynamis Beaucedine
-- Name: Dynamis Beaucedine
-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
	
	SetServerVariable("[DynaBeaucedine]UniqueID",player:getDynamisUniqueID(1284));
	SetServerVariable("[DynaBeaucedine]Already_Received",0);
	
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
	
	player:setVar("DynamisID",GetServerVariable("[DynaBeaucedine]UniqueID"));
	player:setVar("dynaWaitxDay",os.time());
	
end;

-- Leaving the Dynamis by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function onBcnmLeave(player,instance,leavecode)
--print("leave code "..leavecode);
	
	if(leavecode == 2 or leavecode == 3 or leavecode == 4) then
		player:setPos(-284.751,-39.923,-422.948,235,0x6F);
	end
	if(leavecode == 4) then
		SetServerVariable("[DynaBeaucedine]UniqueID",0);
	end
	
end;