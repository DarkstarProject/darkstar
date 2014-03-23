-----------------------------------------
-- Spell: Blank Gaze
-----------------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

    
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));

    local resist = applyResistance(caster,spell,target,dINT,BLUE_SKILL);
    local effect = EFFECT_NONE;

    if(resist > 0.0625) then
		spell:setMsg(341);
		effect = target:dispelStatusEffect();
		if(effect == EFFECT_NONE) then
			spell:setMsg(75);
		end
	else
        spell:setMsg(85);
    end

    return effect;
end;
