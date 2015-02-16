-----------------------------------------
-- ID: 4214
-- Item: Pinch of Lethe Powder
-- Item Effect: Removes up to 3 status effects from target AoE
-----------------------------------------

-- TODO: Make AoE

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

