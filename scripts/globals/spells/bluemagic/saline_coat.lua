-----------------------------------------
-- Spell: Saline Coat
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
    
    if(caster:hasStatusEffect(EFFECT_DIFFUSION)) then
        local diffMerit = caster:getMerit(MERIT_DIFFUSION);
        
        if(diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit;
        end
        
        caster:delStatusEffect(EFFECT_DIFFUSION);
    end
    
    if(caster:hasStatusEffect(EFFECT_MAGIC_DEF_BOOST) == true) then
    	spell:setMsg(75);
	else
		caster:addStatusEffect(EFFECT_MAGIC_DEF_BOOST,40,0,duration);
    end

    return EFFECT_MAGIC_DEF_BOOST;
end;