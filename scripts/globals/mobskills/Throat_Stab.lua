---------------------------------------------
--  Throat Stab
--
--  Description: Deals damage to a single target reducing their HP to 5%. Resets enmity.
--  Type: Physical
--  Utsusemi/Blink absorb: No
--  Range: Single Target
--  Notes: Very short range, easily evaded by walking away from it.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
require("scripts/globals/magic");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

	local currentHP = target:getHP();
	-- remove all by 5%
	local stab = currentHP * .95;
	local damage = 0;

	-- if have more hp then 30%, then reduce to 5%
	if(currentHP / target:getMaxHP() > 0.3) then
		damage = stab;
	else
		-- else you die
		damage = currentHP;
	end
	local dmg = MobFinalAdjustments(damage,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_IGNORE_SHADOWS);

	target:delHP(dmg);
	mob:resetEnmity(target);
	return dmg;
end;
