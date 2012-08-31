-----------------------------------
-- Ability: Footwork
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
   player:addStatusEffect(EFFECT_FOOTWORK,1,0,300);
end;