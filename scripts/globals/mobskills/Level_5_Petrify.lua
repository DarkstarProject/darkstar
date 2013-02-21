---------------------------------------------
--  Level 5 Petrify
--
--  Description: AOE Petrify and on multiples of 5.
--  Type: Physical
--  Utsusemi/Blink absorb: Ignore
--  Range: 15' radial
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
    local typeEffect = EFFECT_PETRIFICATION;
    if(target:getMainLvl()%5 == 0 and target:hasStatusEffect(typeEffect) == false) then
        skill:setMsg(MSG_ENFEEB_IS);

        local power = math.random(0, 25) + 5;
        target:addStatusEffect(typeEffect,1,0,power);--power=1;tic=0;duration=5;
    else
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    end

    return typeEffect;
end;
