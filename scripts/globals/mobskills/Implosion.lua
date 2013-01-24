---------------------------------------------
--  Sweep
--
--  Description: Damages enemies in an area of effect. Additional effect: Stun
--  Type: Magical
--  Wipes Shadows
--  Range: 10' radial
--  Notes:
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
    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * math.random(3,5),accmod,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_WIPE_SHADOWS);

    local typeEffect = EFFECT_STUN;
    if(target:hasStatusEffect(typeEffect) == false) then
        target:addStatusEffect(typeEffect,1,0,math.random(3,8));--power=1;tic=0;duration=5;
    end

    target:delHP(dmg);
    return dmg;
end;
