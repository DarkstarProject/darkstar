-----------------------------------
-- Ability:	Sneak Attack
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
   player:addStatusEffect(EFFECT_SNEAK_ATTACK,1,0,60);
end;