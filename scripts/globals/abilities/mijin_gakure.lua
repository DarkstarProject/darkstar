-----------------------------------
-- Ability: Mijin Gakure
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)

    local dmg = (player:getHP() * 0.8) + (player:getMainLvl() / 0.5);

    target:delHP(dmg);

    return dmg;
end;
