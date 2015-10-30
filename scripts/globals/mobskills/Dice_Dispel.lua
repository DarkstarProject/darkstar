---------------------------------------------
--  Goblin Dice
--
--  Description: Stun
--  Type: Physical (Blunt)
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local effect = target:dispelStatusEffect();
    local effect2 = target:dispelStatusEffect();
    local effect3 = target:dispelStatusEffect();
    local num = 0;

    if(effect ~= EFFECT_NONE) then
        num = num + 1;
    end

    if(effect2 ~= EFFECT_NONE) then
        num = num + 1;
    end

    if(effect3 ~= EFFECT_NONE) then
        num = num + 1;
    end

    if (num == 0) then
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    else
        skill:setMsg(MSG_DISAPPEAR_NUM);
    end

    return num;
end;
