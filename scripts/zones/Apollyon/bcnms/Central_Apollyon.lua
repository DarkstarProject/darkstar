-----------------------------------
-- Area: Appolyon
-- Name: 
-----------------------------------
require("scripts/globals/limbus");
require("scripts/globals/keyitems");

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)		
	SetServerVariable("[Central_Apollyon]UniqueID",GenerateLimbusKey());
	HideArmouryCrates(GetInstanceRegion(1296),APPOLLYON_SE_NE);	
	GetNPCByID(16933248):setAnimation(8);
    if (IsMobDead(16933125)==false) then DespawnMob(16933125);end		
     player:setVar("Limbus_Trade_Item",0);	
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
	player:setVar("limbusbitmap",0);
	player:setVar("characterLimbusKey",GetServerVariable("[Central_Apollyon]UniqueID"));
	player:setVar("LimbusID",1296);	
	player:delKeyItem(COSMOCLEANSE);
end;

-- Leaving  by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish 

function onBcnmLeave(player,instance,leavecode)
--print("leave code "..leavecode);
	if (leavecode == 4) then
        player:setPos(-668,0.1,-666);
		ResetPlayerLimbusVariable(player)
	end
	
end;