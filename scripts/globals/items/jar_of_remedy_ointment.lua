-----------------------------------------
-- ID: 5356
-- Item: Remedy Ointment
-- Item Effect: This potion remedies status ailments.
--    Works on paralysis, silence, blindness, poison, and plague.
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
if (target:hasStatusEffect(EFFECT_SILENCE) or target:hasStatusEffect(EFFECT_BLINDNESS) or target:hasStatusEffect(EFFECT_POISON) or target:hasStatusEffect(EFFECT_PARALYSIS) or target:hasStatusEffect(EFFECT_PLAGUE)) then
	local effectRemoved = 0;	
	while effectRemoved == 0 do
		num = math.random(1,5);
		if (num == 1 and target:hasStatusEffect(EFFECT_SILENCE)) then
			effectRemoved = effectRemoved + 1;
			target:delStatusEffect(EFFECT_SILENCE);
		
		elseif (num == 2 and target:hasStatusEffect(EFFECT_BLINDNESS)) then
			effectRemoved = effectRemoved + 1;
			target:delStatusEffect(EFFECT_BLINDNESS);
		
		elseif (num == 3 and target:hasStatusEffect(EFFECT_POISON)) then
			effectRemoved = effectRemoved + 1;
			target:delStatusEffect(EFFECT_POISON);
		
		elseif (num == 4 and target:hasStatusEffect(EFFECT_PARALYSIS)) then
			effectRemoved = effectRemoved + 1;
			target:delStatusEffect(EFFECT_PARALYSIS);
		
		elseif (num == 5 and target:hasStatusEffect(EFFECT_PLAGUE)) then
			effectRemoved = effectRemoved + 1;
			target:delStatusEffect(EFFECT_PLAGUE);
		end	
	end
end	

end;

