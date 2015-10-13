-----------------------------------------
--	ID: 4182
--  Scroll of Instant ReRaise
--  Brings you back from the dead~!
-----------------------------------------

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
	local power = 1;
	local duration = 1800;
	if (target:hasStatusEffect(EFFECT_RERAISE) ==true) then
		local effect = target:getStatusEffect(EFFECT_RERAISE);
		local oPower = effect:getPower();
		if (oPower > power) then
			target:messageBasic(283); -- Higher Tiered verson means no effect!
		else
			target:delStatusEffect(EFFECT_RERAISE);
			target:addStatusEffect(EFFECT_RERAISE,power,0,duration);
		end
	else	
		target:addStatusEffect(EFFECT_RERAISE,power,0,duration);
	end
end;