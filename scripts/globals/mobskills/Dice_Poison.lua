---------------------------------------------
--  Goblin Dice
--
--  Description: Poison
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
    local typeEffect = EFFECT_POISON;
    if(target:hasStatusEffect(typeEffect) == false) then
        skill:setMsg(MSG_ENFEEB_IS);
        target:addStatusEffect(typeEffect,10,0,120);--power=20;tic=0;duration=120;
    else
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    end
    return typeEffect;
end;
