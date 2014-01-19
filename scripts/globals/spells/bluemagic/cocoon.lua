-----------------------------------
-- Spell: Cocoon
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------
-- onSpellcast
-----------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster, target, spell)

	local power = 50; -- Percentage, not amount.
    
    local duration = 90;

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