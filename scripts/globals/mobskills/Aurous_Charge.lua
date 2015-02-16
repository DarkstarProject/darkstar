---------------------------------------------------
--
-- Aurous Charge
--
--
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_BIND;
    local targetcurrentHP = target:getHP();
    local targetmaxHP = target:getMaxHP(); 
    local hpset = targetmaxHP*0.25;
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_WIPE_SHADOWS,info.hitslanded);
	target:delHP(dmg);
	
    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30);

    if(HP > 1)then
        dmg= hpset;
    else
        dmg = 0;
    end

    target:delHP(dmg);

    return dmg;
end
