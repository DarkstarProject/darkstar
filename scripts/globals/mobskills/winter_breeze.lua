---------------------------------------------
-- Winter Breeze
--
-- Description: AoE Dispel (Only removes one effect) and Stun
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local DISPEL = target:dispelStatusEffect();

    MobStatusEffectMove(mob, target, EFFECT_STUN, 1, 0, 2);

    if (DISPEL == EFFECT_NONE) then
        skill:setMsg(msgBasic.NO_EFFECT); -- no effect
    else
        skill:setMsg(msgBasic.DISAPPEAR);
    end

    return DISPEL;
end;
