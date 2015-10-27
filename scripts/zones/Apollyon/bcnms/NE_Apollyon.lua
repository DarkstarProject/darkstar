-----------------------------------
-- Area: Appolyon
-- Name: NE_Apollyon
-----------------------------------
require("scripts/globals/limbus");
require("scripts/globals/keyitems");

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)	
	SetServerVariable("[NE_Apollyon]UniqueID",GenerateLimbusKey());
	HideArmouryCrates(GetInstanceRegion(1292),APPOLLYON_SE_NE);	
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
	player:setVar("limbusbitmap",0);
	player:setVar("characterLimbusKey",GetServerVariable("[NE_Apollyon]UniqueID"));
	player:setVar("LimbusID",1292);	
	player:delKeyItem(COSMOCLEANSE);
	player:delKeyItem(BLACK_CARD);
end;

-- Leaving  by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish 

function onBcnmLeave(player,instance,leavecode)
--print("leave code "..leavecode);
	
	if (leavecode == 4) then
	 	player:setPos(643,0.1,-600);
		ResetPlayerLimbusVariable(player)
	end
	
end;