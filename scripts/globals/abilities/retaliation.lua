-----------------------------------
-- Ability: Retaliation
-- Authored by Kitala 
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if target:hasStatusEffect(EFFECT_DEFENDER) then  --needs more defensive abilities
		return MSGBASIC_CANNOT_ON_THAT_TARG, 0;
    else
        return 0, 0;
    end
end;

function OnUseAbility(player, target, ability)
		local power = 50;

		target:delStatusEffect(EFFECT_RETALIATION); --removes effect so it doesn't stack/crash upon use etc
		target:addStatusEffect(EFFECT_RETALIATION,power,0,180);
end;