---------------------------------------------------
-- Dark Nova
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
    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3.5,ELE_DARK,dmgmod,TP_MAB_BONUS);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
