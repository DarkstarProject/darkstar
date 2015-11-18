---------------------------------------------------
-- Umbra Smash
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:AnimationSub() == 1) then
		return 1;
	else
		return 0;
	end
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1;
    local accmod = 1;
    local dmgmod = 3;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,0);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_H2H,info.hitslanded);
    target:delHP(dmg);
    return dmg;
end;
