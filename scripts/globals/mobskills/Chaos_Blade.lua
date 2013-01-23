---------------------------------------------
--  Chaos Blade
--
--  Description: Deals Dark damage to enemies within a fan-shaped area. Additional effect: Curse
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores Shadows
--  Range: Melee
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
    local typeEffect = EFFECT_CURSE_I;
    if(target:hasStatusEffect(typeEffect) == false) then
        local duration = math.random(1,2)*30 + 420;
        target:addStatusEffect(typeEffect,30,0,duration);--power=1;tic=0;
    end

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
