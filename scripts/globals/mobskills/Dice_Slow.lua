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
    local slowed = false;
    local sleeped = false;

    slowed = MobStatusEffectMove(mob, target, EFFECT_SLOW, 128, 0, 120);
    sleeped = MobStatusEffectMove(mob, target, EFFECT_SLEEP_I, 1, 0, 30);

    skill:setMsg(MSG_ENFEEB_IS);
    if(sleeped) then
        return EFFECT_SLEEP_I;
    elseif(slowed) then
        return EFFECT_SLOW;
    else
        skill:setMsg(MSG_MISS); -- no effect
    end

    return typeEffect;
end;
