---------------------------------------------------
-- Lunar Roar
-- Fenrir removes two beneficial status effects from enemies within Area of Effect.
---------------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local dis = target:dispelStatusEffect();
    local dis2 = target:dispelStatusEffect();
    local num = 0;

    if (dis ~= EFFECT_NONE) then
        num = num + 1;
    end

    if (dis2 ~= EFFECT_NONE) then
        num = num + 1;
    end

    skill:setMsg(msgBasic.DISAPPEAR_NUM);
    if (num == 0) then
        skill:setMsg(msgBasic.NO_EFFECT);
    end

    return num;

end