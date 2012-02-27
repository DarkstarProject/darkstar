-----------------------------------
-- Ability: Convert
-- Swaps current HP with MP
--
-- At 0 MP this ability will not activate, as it would cause a self-KO. 
-- Instead, a message stating "Player cannot perform that action" will be received. 
-- In the past, the ability would still activate, but it would have no effect.
-----------------------------------

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	local MP = player:getMP();
	local HP = player:getHP();
	if (MP > 0) then
		player:setHP(MP);
		player:setMP(HP);
	end
end;