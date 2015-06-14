---------------------------------------------------
-- Name: Somersault
-- Utsusemi/Blink absorb: 1 shadow
-- Range: Melee 
-- Single Target Attack
-- Notes: not known if multiplier based on TP
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
  return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local numhits = 1;
	local accmod = 1;
    local dmgmod = 2.2;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded,MOBPARAM_1_SHADOW);
	target:delHP(dmg);
	return dmg;
end;
