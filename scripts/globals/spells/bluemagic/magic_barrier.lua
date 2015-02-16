-----------------------------------
-- Spell: Magic Barrier
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster, target, spell)
        
    local duration = 120;
    
    if(caster:hasStatusEffect(EFFECT_DIFFUSION)) then
        local diffMerit = caster:getMerit(MERIT_DIFFUSION);
        
        if(diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit;
        end
        
        caster:delStatusEffect(EFFECT_DIFFUSION);
    end
    
	if (caster:hasStatusEffect(EFFECT_MAGIC_SHIELD) and caster:hasStatusEffect(EFFECT_MAGIC_SHIELD) == true) then
		spell:setMsg(75);
	else
		caster:addStatusEffect(EFFECT_MAGIC_SHIELD,30,0,duration);
		caster:addStatusEffect(EFFECT_MAGIC_SHIELD,5,0,duration);
		spell:setMsg(230);
	end

    return EFFECT_MAGIC_SHIELD;
end;