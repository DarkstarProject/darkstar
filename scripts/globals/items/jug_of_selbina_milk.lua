-----------------------------------------
-- ID: 5575
-- Item: Yogurt
-- Item Effect: Restores 60 HP over 180 seconds
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
	local body = caster:getEquipID(SLOT_BODY);
	if(target:hasStatusEffect(EFFECT_REGEN) == false) then
		if (body == 14520) then -- Dream Robe +1
			target:addStatusEffect(EFFECT_REGEN,1,3,150);
		else
			target:addStatusEffect(EFFECT_REGEN,1,3,120);
		end
	else
		target:messageBasic(423);
	end
end;