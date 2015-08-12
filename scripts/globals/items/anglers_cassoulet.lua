-----------------------------------------
-- ID: 5704
-- Item: Anglers Cassoulet
-- Item Effect: Restores 60 HP over 1 hour,  / 3600 seconds.
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
	if (target:hasStatusEffect(EFFECT_FOOD) == false and target:hasStatusEffect(EFFECT_REGEN) == false) then
		target:addStatusEffect(EFFECT_FOOD,0,0,3600,5704);
		
	else
		target:messageBasic(423);
	end
end;
----------------------------------------
-- onEffectGain
----------------------------------------
function onEffectGain(target,effect)
	target:addStatusEffect(EFFECT_REGEN,1,3,3600);
	target:addMod(MOD_VIT, -1)
	target:addMod(MOD_AGI, 5)
	
end
-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_VIT, -1);
	target:delMod(MOD_AGI, 5);

end;
