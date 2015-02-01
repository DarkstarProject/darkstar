-----------------------------------------
-- ID: 4210
-- Item: Bottle of Lethe Water
-- Item Effect: Removes up to 3 status effects from target
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
	local effect = target:dispelStatusEffect();
	if(effect == EFFECT_NONE) then
		target:messageBasic(423); -- no effect
	else
		local z = 0;
		while z <= 3 do
			target:dispelStatusEffect();
			if(effect == EFFECT_NONE) then
				z = 3;
			end
		z = z + 1;
		end;
	end
end;

