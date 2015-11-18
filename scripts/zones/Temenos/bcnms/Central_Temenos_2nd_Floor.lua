-----------------------------------
-- Area: Temenos
-- Name: 
-----------------------------------



-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
if (GetMobAction(16929039) > 0) then DespawnMob(16929039);end
if (GetMobAction(16929040) > 0) then DespawnMob(16929040);end
if (GetMobAction(16929041) > 0) then DespawnMob(16929041);end
if (GetMobAction(16929042) > 0) then DespawnMob(16929042);end
if (GetMobAction(16929043) > 0) then DespawnMob(16929043);end
if (GetMobAction(16929044) > 0) then DespawnMob(16929044);end
	SetServerVariable("[C_Temenos_2nd]UniqueID",GenerateLimbusKey());
	HideArmouryCrates(GetInstanceRegion(1304),TEMENOS);		
    HideTemenosDoor(GetInstanceRegion(1304));
	player:setVar("Limbus_Trade_Item-T",0);		
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
	player:setVar("limbusbitmap",0);
	player:setVar("characterLimbusKey",GetServerVariable("[C_Temenos_2nd]UniqueID"));
	player:setVar("LimbusID",1304);	
	player:delKeyItem(COSMOCLEANSE);
	player:delKeyItem(WHITE_CARD);
end;

-- Leaving by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function onBcnmLeave(player,instance,leavecode)
--print("leave code "..leavecode);
	if (leavecode == 4) then
	 	player:setPos(580,-1.5,4.452,192);
		ResetPlayerLimbusVariable(player)
	end
end;