---------------------------------------------------
-- Dark Nova
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
    local dmgmod = math.random()*2 + 2;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 3,accmod,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
