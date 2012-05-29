-----------------------------------------
-- Spell: Foe Lullaby
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	duration = 30;
	staff = StaffBonus(caster, spell);
	pCHR = caster:getStat(MOD_CHR);
	mCHR = target:getStat(MOD_CHR);
	dCHR = (pCHR - mCHR);
	resm = applyResistance(caster,spell,target,dCHR,40,staff);
	if(resm < 0.5) then
		spell:setMsg(85);--resist message
		return EFFECT_SLEEP_I;
	end
	
	if(target:hasStatusEffect(EFFECT_SLEEP_II) or target:hasStatusEffect(EFFECT_SLEEP_I)) then
		--No effect
		spell:setMsg(75);
	else
		spell:setMsg(237);
		target:addStatusEffect(EFFECT_SLEEP_I,1,0,duration);
	end
	
	return EFFECT_SLEEP_I;
end;