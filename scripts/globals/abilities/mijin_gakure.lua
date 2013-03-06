-----------------------------------
-- Ability: Mijin Gakure
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

-- Do not use setHP(0) for a spell/ability that kills you.  It does not work,
-- and creates a zombie entity that cannot be added to the enmity list.

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)

--    local dmg = (player:getHP() * 0.8) + (player:getMainLvl() / 0.5);


--    player:setHP(0);
--    target:delHP(dmg);

--    return dmg;
end;
