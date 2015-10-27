-----------------------------------
-- Area: Temenos
-- Name: 
-----------------------------------



-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
if (GetMobAction(16928844) > 0) then DespawnMob(16928844);end
if (GetMobAction(16928853) > 0) then DespawnMob(16928853);end
if (GetMobAction(16928862) > 0) then DespawnMob(16928862);end
if (GetMobAction(16928871) > 0) then DespawnMob(16928871);end
if (GetMobAction(16928880) > 0) then DespawnMob(16928880);end
if (GetMobAction(16928889) > 0) then DespawnMob(16928889);end
if (GetMobAction(16928894) > 0) then DespawnMob(16928894);end
	SetServerVariable("[Temenos_E_Tower]UniqueID",GenerateLimbusKey());
	HideArmouryCrates(GetInstanceRegion(1300),TEMENOS);		
    HideTemenosDoor(GetInstanceRegion(1300));
						
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
	player:setVar("limbusbitmap",0);
	player:setVar("characterLimbusKey",GetServerVariable("[Temenos_E_Tower]UniqueID"));
	player:setVar("LimbusID",1300);	
	player:delKeyItem(COSMOCLEANSE);
	player:delKeyItem(WHITE_CARD);
end;

-- Leaving the Dynamis by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function onBcnmLeave(player,instance,leavecode)
--print("leave code "..leavecode);
	if (leavecode == 4) then
	 	player:setPos(580,-1.5,4.452,192);
		ResetPlayerLimbusVariable(player)
	end
end;