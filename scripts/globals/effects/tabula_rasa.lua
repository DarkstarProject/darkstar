-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (target:hasStatusEffect(EFFECT_LIGHT_ARTS) or target:hasStatusEffect(EFFECT_ADDENDUM_WHITE)) then
		target:addMod(MOD_BLACK_MAGIC_COST, -30);
		target:addMod(MOD_BLACK_MAGIC_CAST, -30);
		target:addMod(MOD_BLACK_MAGIC_RECAST, -30);
	elseif (target:hasStatusEffect(EFFECT_DARK_ARTS) or target:hasStatusEffect(EFFECT_ADDENDUM_BLACK)) then
		target:addMod(MOD_WHITE_MAGIC_COST, -30);
		target:addMod(MOD_WHITE_MAGIC_CAST, -30);
		target:addMod(MOD_WHITE_MAGIC_RECAST, -30);
	else
		target:addMod(MOD_BLACK_MAGIC_COST, -10);
		target:addMod(MOD_BLACK_MAGIC_CAST, -10);
		target:addMod(MOD_BLACK_MAGIC_RECAST, -10);
		target:addMod(MOD_WHITE_MAGIC_COST, -10);
		target:addMod(MOD_WHITE_MAGIC_CAST, -10);
		target:addMod(MOD_WHITE_MAGIC_RECAST, -10);
	end
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	if (target:hasStatusEffect(EFFECT_LIGHT_ARTS) or target:hasStatusEffect(EFFECT_ADDENDUM_WHITE)) then
		target:addMod(MOD_BLACK_MAGIC_COST, 30);
		target:addMod(MOD_BLACK_MAGIC_CAST, 30);
		target:addMod(MOD_BLACK_MAGIC_RECAST, 30);
	elseif (target:hasStatusEffect(EFFECT_DARK_ARTS) or target:hasStatusEffect(EFFECT_ADDENDUM_BLACK)) then
		target:addMod(MOD_WHITE_MAGIC_COST, 30);
		target:addMod(MOD_WHITE_MAGIC_CAST, 30);
		target:addMod(MOD_WHITE_MAGIC_RECAST, 30);
	else
		target:delMod(MOD_BLACK_MAGIC_COST, -10);
		target:delMod(MOD_BLACK_MAGIC_CAST, -10);
		target:delMod(MOD_BLACK_MAGIC_RECAST, -10);
		target:delMod(MOD_WHITE_MAGIC_COST, -10);
		target:delMod(MOD_WHITE_MAGIC_CAST, -10);
		target:delMod(MOD_WHITE_MAGIC_RECAST, -10);
	end
end;