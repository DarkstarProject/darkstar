---------------------------------------------------
-- Lunar Roar
-- Fenrir removes two beneficial status effects from enemies within Area of Effect.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	local moon = 50;--VanadielMoonPhase();
	local buffvalue = 1;

	if(moon > 90) then
		buffvalue = 31;
	elseif(moon > 75) then
		buffvalue = 26;
	elseif(moon > 60) then
		buffvalue = 21;
	elseif(moon > 40) then
		buffvalue = 16;
	elseif(moon > 25) then
		buffvalue = 11;
	elseif(moon > 10) then
		buffvalue = 6;
	end

	target:delStatusEffect(EFFECT_ACCURACY_DOWN);
	target:addStatusEffect(EFFECT_ACCURACY_DOWN,buffvalue,0,180);
	target:delStatusEffect(EFFECT_EVASION_DOWN);
	target:addStatusEffect(EFFECT_EVASION_DOWN,32-buffvalue,0,180);
	return 0;

end