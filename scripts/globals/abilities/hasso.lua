-----------------------------------
-- Ability: Hasso
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	strboost = target:getMainLvl()/7;
	if(target:getMainJob()~=12) then --sjob sam, use sub level
		strboost = target:getSubLvl()/7;
	end
	if(target:isWeaponTwoHanded()) then
		target:delStatusEffect(EFFECT_HASSO);
		target:delStatusEffect(EFFECT_SEIGAN);
		target:addStatusEffect(EFFECT_HASSO,strboost,0,300);
	end
end;
