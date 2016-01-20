---------------------------------------------------
-- Aerial Armor
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
    target:delStatusEffect(EFFECT_BLINK);
    target:addStatusEffect(EFFECT_BLINK,3,0,900);
    skill:setMsg(MSG_BUFF);
    return EFFECT_BLINK;
end