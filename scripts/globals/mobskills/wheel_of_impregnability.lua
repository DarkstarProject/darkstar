---------------------------------------------
-- Wheel of Impregnability
---------------------------------------------
package.loaded["scripts/zones/Empyreal_Paradox/TextIDs"] = nil;
---------------------------------------------
require("scripts/zones/Empyreal_Paradox/TextIDs");
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:hasStatusEffect(dsp.effects.PHYSICAL_SHIELD) or mob:hasStatusEffect(dsp.effects.MAGIC_SHIELD)) then
        return 1;
    end
    mob:showText(mob, PROMATHIA_TEXT + 5);
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effects.PHYSICAL_SHIELD;

    mob:addStatusEffect(dsp.effects.PHYSICAL_SHIELD, 0, 0, 0);
    mob:AnimationSub(1);

    skill:setMsg(msgBasic.SKILL_GAIN_EFFECT);
    return dsp.effects.PHYSICAL_SHIELD;
end;
