-----------------------------------------
-- Spell: Cure
-- Restores target's HP.
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	MND = caster:getMod(MOD_MND);
	VIT = caster:getMod(MOD_VIT);
	HealingMagic = caster:getMod(MOD_HEALING);
	cap = 10;
	rate = 1;
	constant = -10;
	
	Power = 3 * MND + VIT + 3 * (HealingMagic /5);
	
	Base = ((Power / 2) / rate) + constant;
	
	Final = math.floor(Base);
	
	if(Final < capm) then Final = cap; end

	caster:addHP(target,Final);
	return Final;
	
end;