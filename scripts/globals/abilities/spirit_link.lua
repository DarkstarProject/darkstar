-----------------------------------
-- Ability: Spirit Link
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	drainpct = math.random(25,35) / 100;
	drainamount = 0;
	if((player:getHP()/player:getMaxHP()) < drainpct) then --using this will kill you, so use up to 1HP
		drainamount = player:getHP() - 1;
		player:setHP(1);
	else
		drainamount = drainpct*player:getMaxHP();
		player:delHP(drainpct*player:getMaxHP());
	end
	
	drainamount = drainamount * 2;
	
	player:petAddHP(drainamount); --add the hp to pet
	player:addTP(player:petGetTP()/2); --add half pet tp to you
	player:petTP(player:petGetTP()/2); -- remove half tp from pet
	
end;
