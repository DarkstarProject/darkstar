-----------------------------------
-- Ability: Steal
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	local thfLevel;
	if(player:getMainJob()==5) then
		thfLevel = player:getMainLvl()
	else
		thfLevel = player:getSubLvl()
	end
	local stealMod = player:getMod(MOD_STEAL);
	
	if(player:getEquipID(SLOT_RING1) == 13291 and ((player:getHP() / player:getMaxHP() * 100) < 75) and player:getTP() < 100) then stealMod = stealMod +1 end; --Rogue's Ring
	if(player:getEquipID(SLOT_RING2) == 13291 and ((player:getHP() / player:getMaxHP() * 100) < 75) and player:getTP() < 100) then stealMod = stealMod +1 end; --Rogue's Ring

	if(math.random(100) < (50 + stealMod + thfLevel - target:getMainLvl())) then
		local stolen = target:getStealItem();
		player:addItem(stolen);
		player:messageBasic(125,41,stolen);
	else
		player:messageBasic(153,41);
	end
end;