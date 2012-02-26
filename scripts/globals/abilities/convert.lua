-----------------------------------
-- Ability: Chainspell
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
    cHP = player:getHP(); --grabs the hp of the player using ability
	cMP = player:getMP(); --grabs the mp of the player using ability
	player:setHP(cMP);
	player:setMP(cHP);
	
	return;	
end;

