-----------------------------------------
-- Spell: Absolute Terror
-----------------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	local duration = 60;

	-- local dINT = caster:getStat(MOD_MND) - target:getStat(MOD_MND);
	-- local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT) - target:getStat(MOD_INT),BLUE_SKILL,1.0);
	-- if(resist > 0.625) then
		-- resisted!
		-- spell:setMsg(85);
		-- return 0;
	-- end

	if(target:hasStatusEffect(EFFECT_TERROR) == true) then
		-- no effect
		spell:setMsg(75);
	else
		target:addStatusEffect(EFFECT_TERROR,1,0,duration);
		spell:setMsg(236);
	end

	return EFFECT_TERROR;
end;