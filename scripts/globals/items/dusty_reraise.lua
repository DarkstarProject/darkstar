-----------------------------------------
--  ID: 5436
--  Item: Dusty Scroll of ReRaise
--  Effect: Brings you back from the dead~!
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	power = 1;
	duration = 1800;
	if(target:hasStatusEffect(EFFECT_RERAISE) ==true)then
		effect = target:getStatusEffect(EFFECT_RERAISE);
		oPower = effect:getPower();
		if(oPower > power) then
			target:messageBasic(283); -- Higher Tiered verson means no effect!
		else
			target:delStatusEffect(EFFECT_RERAISE);
			target:addStatusEffect(EFFECT_RERAISE,power,0,duration);
		end
	else	
		target:addStatusEffect(EFFECT_RERAISE,power,0,duration);
	end
end;