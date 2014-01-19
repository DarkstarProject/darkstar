-----------------------------------------
-- Spell: Triumphant Roar
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

	local power = 15
	
    local duration = 90;
    
    if(caster:hasStatusEffect(EFFECT_DIFFUSION)) then
        local diffMerit = caster:getMerit(MERIT_DIFFUSION);
        
        if(diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit;
        end
        
        caster:delStatusEffect(EFFECT_DIFFUSION);
    end
    
	if(caster:hasStatusEffect(EFFECT_ATTACK_BOOST) == true) then
		local effect = caster:getStatusEffect(EFFECT_ATTACK_BOOST);
		effect:setPower(effect:getPower() + power);
		caster:addMod(MOD_ATTP,power);
	else
		caster:addStatusEffect(EFFECT_ATTACK_BOOST,power,1,duration);
	end
	return EFFECT_ATTACK_BOOST;
end;