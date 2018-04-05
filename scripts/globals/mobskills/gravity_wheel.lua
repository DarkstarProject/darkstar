---------------------------------------------
--  Gravity Wheel
--
--  Description: Deals heavy damage to players in an area of effect. Additional effect: Weight
--  Type: Physical
--  2-3 Shadows
--  Range: Unknown
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    if (mob:AnimationSub() == 2) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 3;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_2_SHADOW);

    target:delHP(dmg);
    MobStatusEffectMove(mob, target, dsp.effects.WEIGHT, 1, 0, 30);
    return dmg;
end;
