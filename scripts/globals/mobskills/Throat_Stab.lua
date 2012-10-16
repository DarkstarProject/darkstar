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
	local numhits = 1;
	local accmod = 1;
	local dmgmod = 1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local fivePercent = ((target:getMaxHP()/100)*5);
	local currentHP = target:getHP();
	if(currentHP > fivePercent and info.dmg > 0) then
		local dmg = currentHP - fivePercent;
	else
		local dmg = 0;
	end
	local dmg = MobFinalAdjustments(dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_IGNORE_SHADOWS);

	target:delHP(dmg);
	mob:updateEnmity(target,-300,1); -- no way to remove entity from enmity table currently as Clear() does not work.
	return dmg;
end;
