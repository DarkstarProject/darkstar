-----------------------------------
-- Spell: Reactor Cool
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
        
    local duration = 120;
    
    if(caster:hasStatusEffect(EFFECT_DIFFUSION)) then
        local diffMerit = caster:getMerit(MERIT_DIFFUSION);
        
        if(diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit;
        end
        
        caster:delStatusEffect(EFFECT_DIFFUSION);
    end
    
	if (caster:hasStatusEffect(EFFECT_DEFENSE_BOOST) and caster:hasStatusEffect(EFFECT_ICE_SPIKES) == true) then
		spell:setMsg(75);
	else
		caster:addStatusEffect(EFFECT_DEFENSE_BOOST,12,0,duration);
		caster:addStatusEffect(EFFECT_ICE_SPIKES,5,0,duration);
		spell:setMsg(230);
	end

    return EFFECT_ICE_SPIKES;
end;