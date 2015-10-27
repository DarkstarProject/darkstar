-----------------------------------
-- Area: Temenos
-- Name: 
-----------------------------------



-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)	
	SetServerVariable("[Temenos_W_Tower]UniqueID",GenerateLimbusKey());
	HideArmouryCrates(GetInstanceRegion(1298),TEMENOS);		
    HideTemenosDoor(GetInstanceRegion(1298));		
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
	player:setVar("limbusbitmap",0);
	player:setVar("characterLimbusKey",GetServerVariable("[Temenos_W_Tower]UniqueID"));
	player:setVar("LimbusID",1298);	
	player:delKeyItem(COSMOCLEANSE);
	player:delKeyItem(WHITE_CARD);
end;

-- Leaving  by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function onBcnmLeave(player,instance,leavecode)
--print("leave code "..leavecode);

	if (leavecode == 4) then
	 	player:setPos(580,-1.5,4.452,192);
		ResetPlayerLimbusVariable(player)
	end
end;