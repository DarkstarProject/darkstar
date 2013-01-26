---------------------------------------------
--  Occultation
--
--  Description: Creates 25 shadows
--  Type: Magical (Wind)
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local base = math.random(10,25);
    skill:setMsg(MSG_BUFF);
    local typeEffect = EFFECT_BLINK;
    mob:delStatusEffect(typeEffect);
    mob:addStatusEffect(typeEffect,base,0,120);
    return typeEffect;
end;
