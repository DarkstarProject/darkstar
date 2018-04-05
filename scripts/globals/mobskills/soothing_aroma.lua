---------------------------------------------
-- Soothing Aroma
-- Family: Rafflesia
-- Description: Charms nearby players.
-- Type:
-- Utsusemi/Blink absorb:
-- Range:
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:getHPP() > 50 and mob:getPool() == 3326) then
        -- Raskovnik doesn't use this for the 1st half of its HP.
        return 1;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effects.CHARM_I;

    if (not target:isPC()) then
        skill:setMsg(msgBasic.SKILL_MISS);
        return typeEffect;
    end

    local msg = MobStatusEffectMove(mob, target, typeEffect, 0, 3, 150)
    if (msg == msgBasic.SKILL_ENFEEB_IS) then
        mob:charm(target);
    end
    skill:setMsg(msg);

    return typeEffect;
end;
