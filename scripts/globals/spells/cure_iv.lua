-----------------------------------------
-- Spell: Cure IV
-- Restores target's HP.
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	MND = caster:getMod(MOD_MND);
	VIT = target:getMod(MOD_VIT);
	HealingMagic = caster:getMod(MOD_HEALING);
	cap = 270;
	rate = 0.6;
	constant = 165;
	
	Power = 3 * MND + VIT + 3 * (HealingMagic /5);
	
	Base = ((Power / 2) / rate) + constant;
	
	Final = math.floor(Base);
	
	if(Final < cap) then Final = cap; end

	target:addHP(Final);
	return Final;
	
end;