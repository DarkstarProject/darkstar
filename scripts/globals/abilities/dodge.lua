-----------------------------------
--	Dodge
-----------------------------------

require("scripts/globals/status");

function OnUseAbility(player, target, ability)
   player:addStatusEffect(EFFECT_DODGE,1,0,120);
end;