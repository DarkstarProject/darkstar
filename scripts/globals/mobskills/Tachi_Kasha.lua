---------------------------------------------
--  Tachi: Kasha
--
--  Description:  Paralyzes target. Damage varies with TP.
--  Type: Physical
--  Shadow per hit
--  Range: Melee
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	mob:messageBasic(43, 0, 692+256);
	skill:setSkillchain(152);

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 3.5;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1.56,1.88,2.50);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

   MobStatusEffectMove(mob, target, EFFECT_PARALYSIS, 25, 0, 60);

	-- About 400-500
   target:delHP(dmg);
	return dmg;
end;
