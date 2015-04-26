---------------------------------------------
--  Numbing Noise
--
--  Description: Creates an unsettling sound. Additional effect: Stun
--  Type: Physical
--  Utsusemi/Blink absorb: Ignore
--  Range: 10' cone
--  Notes:
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
-- For Race Runner
local path = {
    -539, 0, -481,
    -556, 0, -478,
    -581, 0, -475,
    -579, -3, -460,
    -572, 2, -433,
    -545, 1, -440,
    -532, 0, -466,
    -535, 0, -482,
    -547, 1, -486
};

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_STUN;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 5));
    
    if (mob:getID()==16810018) then -- Race Runner
        -- Insert a disengage function here when it gets written.
        mob:pathThrough(pathfind.first(path));
    end
    return typeEffect;
end;