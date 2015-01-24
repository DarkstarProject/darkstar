-----------------------------------
--	EFFECT_BULLY
-- Intimidates target.
-- Removes the directional
-- requirement from Sneak Attack
-- for main job Thieves when active. 
-----------------------------------

function onEffectGain(target,effect)

	if (effect:getPower() == 1) then
		-- Amorph
		target:addMod(MOD_AMORPH_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 2) then
		-- Aquan
		target:addMod(MOD_AQUAN_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 3) then
		-- Arcana
		target:addMod(MOD_ARCANA_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 6) then
		-- Beast
		target:addMod(MOD_BEAST_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 8) then
		-- Bird
		target:addMod(MOD_BIRD_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 9) then
		-- Demon
		target:addMod(MOD_DEMON_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 10) then
		-- Dragon
		target:addMod(MOD_DRAGON_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 12) then
		-- Empty
		target:addMod(MOD_EMPTY_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 13) then
		-- Humanoid
		target:addMod(MOD_HUMANOID_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 14) then
		-- Lizard
		target:addMod(MOD_LIZARD_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 15) then
		-- Lumorian
		target:addMod(MOD_LUMORIAN_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 16) then
		-- Luminion
		target:addMod(MOD_LUMINION_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 17) then
		-- Plantoid
		target:addMod(MOD_PLANTOID_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 18) then
		-- Undead
		target:addMod(MOD_UNDEAD_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 20) then
		-- Vermin
		target:addMod(MOD_VERMIN_KILLER, effect:getSubPower());
	else
		-- Default catch all you should never end up here.
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

	if (effect:getPower() == 1) then
		-- Amorph
		target:delMod(MOD_AMORPH_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 2) then
		-- Aquan
		target:delMod(MOD_AQUAN_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 3) then
		-- Arcana
		target:delMod(MOD_ARCANA_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 6) then
		-- Beast
		target:delMod(MOD_BEAST_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 8) then
		-- Bird
		target:delMod(MOD_BIRD_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 9) then
		-- Demon
		target:delMod(MOD_DEMON_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 10) then
		-- Dragon
		target:delMod(MOD_DRAGON_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 12) then
		-- Empty
		target:delMod(MOD_EMPTY_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 13) then
		-- Humanoid
		target:delMod(MOD_HUMANOID_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 14) then
		-- Lizard
		target:delMod(MOD_LIZARD_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 15) then
		-- Lumorian
		target:delMod(MOD_LUMORIAN_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 16) then
		-- Luminion
		target:delMod(MOD_LUMINION_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 17) then
		-- Plantoid
		target:delMod(MOD_PLANTOID_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 18) then
		-- Undead
		target:delMod(MOD_UNDEAD_KILLER, effect:getSubPower());
	elseif (effect:getPower() == 20) then
		-- Vermin
		target:delMod(MOD_VERMIN_KILLER, effect:getSubPower());
	else
		-- Default catch all you should never end up here.
	end

end;