-----------------------------------------
-- Spell: Viruna
-- Removes disease or plague from target.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	if (target:delStatusEffect(EFFECT_DISEASE)) then
		spell:setMsg(83);
		return EFFECT_DISEASE;
	elseif (target:delStatusEffect(EFFECT_PLAGUE)) then
		spell:setMsg(83);
		return EFFECT_PLAGUE;
	else
        spell:setMsg(75);
    end

    return 0;
end;