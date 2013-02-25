---------------------------------------------------
-- Flame Breath
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnPetAbility(target, pet, skill)

    local dmgmod = MobBreathMove(pet, target, 0.182, 0.75, ELE_FIRE, 460);

	dmg = MobFinalAdjustments(dmgmod,pet,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end