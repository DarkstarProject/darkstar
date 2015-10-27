-----------------------------------
-- Area: Temenos
-- Name: 
-----------------------------------



-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)	
	SetServerVariable("[C_Temenos_4th]UniqueID",GenerateLimbusKey());
	HideArmouryCrates(GetInstanceRegion(1306),TEMENOS);		
    HideTemenosDoor(GetInstanceRegion(1306));
	player:setVar("Limbus_Trade_Item-T",0);
if (GetMobAction(16928986) > 0) then DespawnMob(16928986);end
if (GetMobAction(16928987) > 0) then DespawnMob(16928987);end
if (GetMobAction(16928988) > 0) then DespawnMob(16928988);end	
	for n=16928991,16929003,1 do	  
	    if (GetMobAction(n) > 0) then DespawnMob(n);end
	end	
--print("spawn_coffer");
  SpawnCofferTemenosCFloor4();
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
	player:setVar("limbusbitmap",0);
	player:setVar("characterLimbusKey",GetServerVariable("[C_Temenos_4th]UniqueID"));
	player:setVar("LimbusID",1306);	
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