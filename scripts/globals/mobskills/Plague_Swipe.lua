---------------------------------------------
--  Plague Swipe
--
--  Description: Delivers a threefold attack in an cone effect behind user. Additional effect: Bio + Plague
--  Type: Physical
--  2-3 Shadows
--  Range: Backward Arc
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	-- TODO: Replace this when there's a better method than isFacingTheSameDirection() aka isBehind
	if (target:isBehind(mob) == false) then
		return 1;
	end
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	local numhits = 3;
	local accmod = 1;
	local dmgmod = 1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

   MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_BIO, 7, 3, 60);
   MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_PLAGUE, 5, 3, 60);

	target:delHP(dmg);
	return dmg;
end;
