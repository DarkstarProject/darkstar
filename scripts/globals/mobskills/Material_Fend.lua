---------------------------------------------
--  Material Fend
--
--  Description: Enhances evasion.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes: evasion increase.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    if(mob:hasStatusEffect(EFFECT_EVASION_BOOST)) then
        return 1;
    end
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_EVASION_BOOST;
    if(mob:hasStatusEffect(typeEffect) == true) then
        skill:setMsg(MSG_NO_EFFECT);
    else
        mob:addStatusEffect(typeEffect,35,0,120);--power=25;tic=0;duration=60;
        skill:setMsg(MSG_BUFF);
    end
    return typeEffect;
end;
