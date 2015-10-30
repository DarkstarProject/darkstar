-----------------------------------------
-- Spell: Cursna
-- Removes curse and bane from target.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	local curse = target:getStatusEffect(EFFECT_CURSE_I);
	local curse2 = target:getStatusEffect(EFFECT_CURSE_II);
	local bane = target:getStatusEffect(EFFECT_BANE);
	local bonus = target:getMod(MOD_ENHANCES_CURSNA);

	spell:setMsg(75);
	if (curse ~= nil and curse2 ~= nil and bane ~= nil) then
		target:delStatusEffect(EFFECT_CURSE_I);
		target:delStatusEffect(EFFECT_CURSE_II);
		target:delStatusEffect(EFFECT_BANE);
		final = EFFECT_CURSE_II;
		spell:setMsg(83);
	elseif (curse ~= nil and bane ~= nil) then
		target:delStatusEffect(EFFECT_CURSE_I);
		target:delStatusEffect(EFFECT_BANE);
		final = EFFECT_CURSE_I;
		spell:setMsg(83);
	elseif (curse2 ~= nil and bane ~= nil) then
		target:delStatusEffect(EFFECT_CURSE_II);
		target:delStatusEffect(EFFECT_BANE);
		final = EFFECT_CURSE_II;
		spell:setMsg(83);
	elseif (curse ~= nil) then
		target:delStatusEffect(EFFECT_CURSE_I);
		final = EFFECT_CURSE_I;
		spell:setMsg(83);
	elseif (curse2 ~= nil) then
		target:delStatusEffect(EFFECT_CURSE_II);
		final = EFFECT_CURSE_II;
		spell:setMsg(83);
	elseif (bane ~= nil) then
		target:delStatusEffect(EFFECT_BANE);
		final = EFFECT_BANE;
		spell:setMsg(83);
	elseif (target:hasStatusEffect(EFFECT_DOOM) and math.random() <= (0.25+bonus)) then
		-- remove doom
		final = EFFECT_DOOM;
		target:delStatusEffect(EFFECT_DOOM);
		spell:setMsg(359);
	end
	return final;
end;