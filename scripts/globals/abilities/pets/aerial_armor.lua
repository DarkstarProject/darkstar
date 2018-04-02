---------------------------------------------
-- Aerial Armor
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
    target:delStatusEffect(EFFECT.BLINK);
    target:addStatusEffect(EFFECT.BLINK,3,0,900);
    skill:setMsg(msgBasic.SKILL_GAIN_EFFECT);
    return EFFECT.BLINK;
end