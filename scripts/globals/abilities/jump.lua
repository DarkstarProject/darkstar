-----------------------------------
-- Ability: Jump
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	-- Under Spirit Surge, Jump also decreases target defence by 20% for 60 seconds
	if(player:hasStatusEffect(EFFECT_SPIRIT_SURGE) == true) then
		if(target:hasStatusEffect(EFFECT_DEFENSE_DOWN) == false) then
			target:addStatusEffect(EFFECT_DEFENSE_DOWN, 20, 0, 60);
		end
	end
	return 0,0;
end;

function onUseAbility(player, target, ability)
end;