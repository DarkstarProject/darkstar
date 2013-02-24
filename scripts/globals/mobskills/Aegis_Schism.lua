---------------------------------------------
--  Aegis Schism
--
--  Description: Damage varies with TP. Additional effect: defense down
--  Type: Physical (Blunt)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.3;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);

    local typeEffect = EFFECT_DEFENSE_DOWN;
    local power = 75;
    local duration = 120;
    if(MobPhysicalHit(skill, dmg, target, info.hitslanded)) then
        MobStatusEffectMove(mob, target, typeEffect, power, 0, duration);
    end

    target:delHP(dmg);
    return dmg;
end;
