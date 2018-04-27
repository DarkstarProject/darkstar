---------------------------------------------
-- Lunar Roar
-- Fenrir removes up to 10 beneficial status effects from enemies within Area of Effect.
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local effects = target:getStatusEffects();
    local num = 0;

    for i,effect in ipairs(effects) do
        -- check mask bit for EFFECTFLAG_DISPELABLE
        if (target:getMaskBit(effect:getFlag(),0) == true and effect:getType() ~= dsp.effects.RERAISE and num < 10) then
            target:delStatusEffect(effect:getType());
            num = num + 1;
        end
    end

    skill:setMsg(msgBasic.DISAPPEAR_NUM);
    if (num == 0) then
        skill:setMsg(msgBasic.SKILL_NO_EFFECT);
    end

    return num;

end;