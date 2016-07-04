---------------------------------------------
--  Bilgestorm
--
--  Description: Deals damage in an area of effect. Additional effect: Lowers attack, accuracy, and defense
--  Type: Physical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown
--  Notes: Only used at low health.*Experienced the use at 75%*
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
  if(mob:getFamily() == 316) then
    local mobSkin = mob:getModelId();

    if (mobSkin == 1839) then
        return 0;
    else
        return 1;
    end
  end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local power = math.random(20,25);

    MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_ACCURACY_DOWN, power, 0, 60);
    MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_ATTACK_DOWN, power, 0, 60);
    MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_DEFENSE_DOWN, power, 0, 60);

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
