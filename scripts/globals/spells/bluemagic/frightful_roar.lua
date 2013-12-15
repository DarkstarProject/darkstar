-----------------------------------------
-- Spell: Frightful Roar
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
	if(resist > (0.0652)) then
		-- resisted!
		spell:setMsg(85);
		return 0;
	end

	if(target:hasStatusEffect(EFFECT_DEFENSE_DOWN) == true) then
			spell:setMsg(75);
	else
		target:addStatusEffect(EFFECT_DEFENSE_DOWN,10,0,duration);
		spell:setMsg(236);
	end

	return EFFECT_DEFENSE_DOWN;
end;