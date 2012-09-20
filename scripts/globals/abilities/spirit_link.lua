-----------------------------------
-- Ability: Spirit Link
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)

	local drainpct = math.random(25,35) / 100;
	local playerHP = player:getHP();
	local playerMaxHP = player:getMaxHP();
	local drainamount = drainpct * playerHP;
	
	if (player:hasStatusEffect(EFFECT_STONESKIN)) then
		local skin = player:getMod(MOD_STONESKIN);
		
		if(skin >= drainamount) then
			if(skin == drainamount) then 
				player:delStatusEffect(EFFECT_STONESKIN);
			else
				player:delMod(MOD_STONESKIN,drainamount);
			end
		elseif((skin + playerHP) <= drainamount) then
			drainamount = playerHP - 1 + skin;
			player:delStatusEffect(EFFECT_STONESKIN);
			player:setHP(1);
		else
			player:delStatusEffect(EFFECT_STONESKIN);
			player:delHP((drainamount-skin));
		end
	elseif(playerHP < drainamount) then --using this will kill you, so use up to 1HP
		drainamount = player:getHP() - 1;
		player:setHP(1);
	else
		player:delHP(drainamount);
	end
	healPet = drainamount * 2;
	if(player:getEquipID(4)==15238) then
		healPet = healPet + 15;
	end
	player:petAddHP(healPet); --add the hp to pet
	
	local petTP = player:petGetTP();
	player:addTP(petTP/2); --add half pet tp to you
	player:petTP(petTP/2); -- remove half tp from pet
	
end;
