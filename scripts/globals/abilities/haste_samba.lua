-----------------------------------
-- Ability: Haste Samba
-----------------------------------
 
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------
 
function OnUseAbility(player, target, ability)
	player:delStatusEffect(EFFECT_DRAIN_SAMBA);
	player:delStatusEffect(EFFECT_ASPIR_SAMBA);
	player:addStatusEffect(EFFECT_HASTE_SAMBA,1,0,120);
end;