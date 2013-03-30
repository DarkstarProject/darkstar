---------------------------------------------------
-- Hydro Shot
-- Additional effect: Enmity Down. Chance of effect varies with TP.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)


    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.8;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_H2H,info.hitslanded);

    local typeEffect = EFFECT_ENMITY_DOWN;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 10, 3, 120);
    mob:resetEnmtiy(target);

	target:delHP(dmg);
	return dmg;
end;
