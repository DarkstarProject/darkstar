---------------------------------------------
--  Promyvion Brume
--
--  Description: AoE Additional effect: poison
--  Type: Magical Water
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 10' cone
--  Notes: Additional effect can be removed with Poisona.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    if(target:hasStatusEffect(EFFECT_POISON)) then
        return 1;
    end
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_POISON;
    if(target:hasStatusEffect(typeEffect) == false) then
            target:addStatusEffect(typeEffect,5,3,180);
    end

    local dmgmod = .9;
    local accmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
