-----------------------------------
--
--  EFFECT_AVATAR
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	power = effect:getPower();
	element = target:getPetElement();
	if element == nil or element == 0 then
		target:delStatusEffect(EFFECT_AVATAR);
	else
		if target:getEquipID(SLOT_HANDS) == 14062 and target:getPetName() == 'Carbuncle' then
			power = math.floor(power/2);
		end
		if target:getEquipID(SLOT_HEAD) == 16154 and target:getPetName() == 'Garuda' then
			power = power - 2;
		end
		strong = {MOD_FIRE_AFFINITY, MOD_EARTH_AFFINITY, MOD_WATER_AFFINITY, MOD_WIND_AFFINITY, MOD_ICE_AFFINITY, MOD_THUNDER_AFFINITY, MOD_LIGHT_AFFINITY, MOD_DARK_AFFINITY}
		weak = {MOD_WATER_AFFINITY, MOD_WIND_AFFINITY, MOD_THUNDER_AFFINITY, MOD_ICE_AFFINITY, MOD_FIRE_AFFINITY, MOD_EARTH_AFFINITY, MOD_DARK_AFFINITY, MOD_LIGHT_AFFINITY}
		affinity = target:getMod(strong[element]) - target:getMod(weak[element]);
		if affinity > 0 then
			power = power - affinity - 1;
		elseif affinity < 0 then
			power = power - affinity + 1;
		end

		power = power - target:getMod(MOD_AVATAR_PERPETUATION);
		if power < 1 then
			power = 1;
		end
		if target:hasStatusEffect(EFFECT_ASTRAL_FLOW) then
			power = 0;
		end
		target:delMP(power);
		if target:getMP() == 0 then
			target:despawnPet();
			target:delStatusEffect(EFFECT_AVATAR);
		end
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;