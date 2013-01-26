---------------------------------------------
--  Spectral Barrier
--
--  Description: Magic shield
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_MAGIC_SHIELD;

    mob:delStatusEffect(EFFECT_ARROW_SHIELD);
    mob:delStatusEffect(EFFECT_MAGIC_SHIELD);
    mob:delStatusEffect(EFFECT_PHYSICAL_SHIELD);
    mob:addStatusEffect(typeEffect,1,0,60);--power=25;tic=0;duration=60;
    skill:setMsg(MSG_BUFF);
    return typeEffect;
end;
