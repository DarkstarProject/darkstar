---------------------------------------------------
-- Sand Breath
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnPetAbility(target, pet, skill)
    local dmgmod = MobBreathMove(pet, target, 0.182, 0.75, ELE_EARTH);
	dmg = MobFinalAdjustments(dmgmod,pet,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end