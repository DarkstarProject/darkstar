---------------------------------------------
--  Serpentine Tail
--
--  Description: Deals heavy damage to a target behind the user.
--  Type: Physical
--  2-3 Shadows
--  Range: Back
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
   -- TODO: Replace this with a better solution than isBehind()
	if(target:isBehind(mob) == false) then
		return 1;
	end
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 4.25;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,2,3,4);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_3_SHADOW);

	target:delHP(dmg);
	return dmg;
end;
