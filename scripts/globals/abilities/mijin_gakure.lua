-----------------------------------
-- Ability: Mijin Gakure
-----------------------------------

require("scripts/globals/monstertpmoves");
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
	local resist = applyPlayerResistance(player, nil, target, player:getStat(MOD_INT)-target:getStat(MOD_INT), 0, ELE_NONE);
	
	dmg = dmg * resist;

    target:delHP(dmg);

    return dmg;
end;
