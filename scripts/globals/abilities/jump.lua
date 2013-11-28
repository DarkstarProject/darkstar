-----------------------------------
-- Ability: Jump
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	-- Under Spirit Surge, Jump also decreases target defence by 20% for 60 seconds
	if(player:hasStatusEffect(EFFECT_SPIRIT_SURGE) == true) then
		if(target:hasStatusEffect(EFFECT_DEFENSE_DOWN) == false) then
			target:addStatusEffect(EFFECT_DEFENSE_DOWN, 20, 0, 60);
		end
	end
	return 0,0;
end;

function OnUseAbility(player, target, ability)
end;