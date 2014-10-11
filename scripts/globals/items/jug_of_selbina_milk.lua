-----------------------------------------
-- ID: 4378
-- Item: Jug of Selbina Milk
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
		if(target:hasStatusEffect(EFFECT_REGEN) == false) then
		if (target:getEquipID(SLOT_BODY) == 14520) then -- Dream Robe +1
			target:addStatusEffect(EFFECT_REGEN,1,3,150);
		else
end
			target:addStatusEffect(EFFECT_REGEN,1,3,120);
		else
		target:messageBasic(423);

	end
end;
