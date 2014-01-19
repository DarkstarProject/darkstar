-----------------------------------
-- Spell: Plasma Charge
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
        
    local duration = 50;

    if(caster:hasStatusEffect(EFFECT_DIFFUSION)) then
        local diffMerit = caster:getMerit(MERIT_DIFFUSION);
        
        if(diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit;
        end
        
        caster:delStatusEffect(EFFECT_DIFFUSION);
    end
    
		caster:addStatusEffect(EFFECT_SHOCK_SPIKES,5,0,duration);
		spell:setMsg(230);

    return EFFECT_DEFENSE_BOOST;
end;
