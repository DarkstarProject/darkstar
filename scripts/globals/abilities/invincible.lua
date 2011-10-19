-----------------------------------
-- 	Invincible		 --
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/status");

function OnUseAbility(player, target, ability)
--print();

player:addStatusEffect(EFFECT_INVINCIBLE,1,0,30);
target:updateEnmity(player,7200,1)
end;