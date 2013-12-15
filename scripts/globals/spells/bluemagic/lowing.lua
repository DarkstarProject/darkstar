-----------------------------------------
-- Spell: Lowing
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/bluemagic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	local duration = 60;
	
	local dINT = caster:getStat(MOD_MND) - target:getStat(MOD_MND);
	local resist = applyResistance(caster,spell,target,dINT,37);
	if(resist > 0.0625) then
	-- resisted!
		spell:setMsg(85);
		return 0;
	end

		target:addStatusEffect(EFFECT_PLAGUE,5,0,duration);
		spell:setMsg(236);

	return EFFECT_PLAGUE;
	
end;