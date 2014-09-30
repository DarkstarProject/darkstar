-----------------------------------
-- Ability: Scavenge
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");



-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(user, target, ability)
	
	-- RNG AF2 quest check
	local FireAndBrimstoneCS = user:getVar("fireAndBrimstone");		
	
	if (user:getZone():getID() == 151 and FireAndBrimstoneCS == 5 and -- zone + quest match
		user:getYPos() > -43 and user:getYPos() < -38 and -- Y match
	    user:getXPos() > -85 and user:getXPos() < -73 and -- X match
		user:getZPos() > -85 and user:getZPos() < -75 and -- Z match		
		math.random(100) < 50) then
		
		if (user:getFreeSlotsCount() == 0) then 
			user:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1113);
		else 
			user:addItem(1113);
			user:messageSpecial(ITEM_OBTAINED,1113);
		end
		
	else
	
	-- TODO: whom ever fancies making scavenger.  The RNG stuff can then be refactored
	
	end
	
end;


