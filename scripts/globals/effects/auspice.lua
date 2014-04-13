-----------------------------------
--
-- EFFECT_AUSPICE
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	--Auspice Reduces TP via adding to your Subtle Blow Mod
	local feet = target:getEquipID(SLOT_FEET);
	--If you have Orison Duckbills +2, you get Subtle Blow +20
	if(feet == 11146) then
		--printf("AUSPICE: Adding Subtle Blow +%d!", 20);
		target:setMod(MOD_AUSPICE, 20);
		target:addMod(MOD_SUBTLE_BLOW, 20);	
	--If you have Orison Duckbills +1, you get Subtle Blow +15
	elseif(feet == 11246) then
		--printf("AUSPICE: Adding Subtle Blow +%d!", 15);
		target:setMod(MOD_AUSPICE, 15);
		target:addMod(MOD_SUBTLE_BLOW, 15);
	--The normal Auspice Bonus is Subtle Blow +10
	else
		--printf("AUSPICE: Adding Subtle Blow +%d!", 10);
		target:setMod(MOD_AUSPICE, 10);
		target:addMod(MOD_SUBTLE_BLOW, 10);
	end

	--Afflatus Misery Bonuses
	target:setMod(MOD_AFFLATUS_MISERY_ACC_BONUS, 0);
	
	if(target:hasStatusEffect(EFFECT_AFFLATUS_MISERY)) then
		target:addMod(MOD_ENSPELL,18);
		target:addMod(MOD_ENSPELL_DMG,effect:getPower());
	end
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	local subtleBlow = target:getMod(MOD_AUSPICE);
	--printf("AUSPICE: Removing Subtle Blow +%d!", subtleBlow);
	target:delMod(MOD_SUBTLE_BLOW, subtleBlow);
	target:setMod(MOD_AUSPICE, 0);
	
	--Clean Up Any Bonuses That From Afflatus Misery Combo
	local accuracyBonus = target:getMod(MOD_AFFLATUS_MISERY_ACC_BONUS);
	--printf("AUSPICE: Removing Accuracy Bonus +%d!", accuracyBonus);
	target:delMod(MOD_ACC, accuracyBonus);
	target:setMod(MOD_AFFLATUS_MISERY_ACC_BONUS, 0);
	
	target:setMod(MOD_ENSPELL_DMG,0);
	target:setMod(MOD_ENSPELL,0);
end;