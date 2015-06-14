---------------------------------------------------
-- Shining Ruby
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
	target:delStatusEffect(EFFECT_SHINING_RUBY);
	target:addStatusEffect(EFFECT_SHINING_RUBY,1,0,180);
	skill:setMsg(MSG_BUFF);
	return EFFECT_SHINING_RUBY;
end