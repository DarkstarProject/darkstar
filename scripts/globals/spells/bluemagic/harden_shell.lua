-----------------------------------
-- Spell: Harden Shell
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    if caster:hasStatusEffect(EFFECT_UNBRIDLED_LEARNING) then
       return 0;
    else
      return MSGBASIC_STATUS_PREVENTS;
    end
end;

function onSpellCast(caster, target, spell)

	local power = 200; -- Percentage, not amount.
    
    local duration = 60;

    if(caster:hasStatusEffect(EFFECT_DIFFUSION)) then
        local diffMerit = caster:getMerit(MERIT_DIFFUSION);
        
        if(diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit;
        end
        
        caster:delStatusEffect(EFFECT_DIFFUSION);
    end
    
	if(target:addStatusEffect(EFFECT_DEFENSE_BOOST,power,0,duration)) then
		spell:setMsg(230);
	else
		spell:setMsg(75);
	end

    return EFFECT_DEFENSE_BOOST;
end;