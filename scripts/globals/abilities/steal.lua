-----------------------------------
-- Ability: Steal
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	local rate = math.random(100);
	local thfLevel;
	if(target:getMainJob()==5) then
		thfLevel = player:getMainLvl()
	else
		thfLevel = player:getSubLvl()
	end
	local stealMod = 0;
	if(player:getEquipID(SLOT_NECK) == 13112) then stealMod = stealMod +1 end; --Rabbit Charm
	if(player:getEquipID(SLOT_WAIST) == 15880) then stealMod = stealMod +1 end; --Key Ring Belt
	
	if(player:getEquipID(SLOT_RING1) == 13291 and ((player:getHP() / player:getMaxHP() * 100) < 75) and player:getTP() < 100) then stealMod = stealMod +1 end; --Rogue's Ring
	if(player:getEquipID(SLOT_RING2) == 13291 and ((player:getHP() / player:getMaxHP() * 100) < 75) and player:getTP() < 100) then stealMod = stealMod +1 end; --Rogue's Ring
	
	switch(player:getEquipID(SLOT_HANDS)) : caseof{
	[13966] = function (x) stealMod = stealMod +1 end; --Rogue's Armlets
	[14895] = function (x) stealMod = stealMod +1 end; --Rogue's Armlets +1
	[12748] = function (x) stealMod = stealMod +3 end; --Thief's Kote
	}
	
	if(player:getEquipID(SLOT_HEAD) == 12514) then stealMod = stealMod +1 end; --Rogue's Bonnet
	
	switch(player:getEquipID(SLOT_LEGS)) : caseof{
	[14219] = function (x) stealMod = stealMod +1 end; --Rogue's Culottes
	[15122] = function (x) stealMod = stealMod +5 end; --Assassin's Culottes
	[15585] = function (x) stealMod = stealMod +5 end; --Assassin's Culottes +1
	}
	
	if(player:getEquipID(SLOT_FEET) == 14094) then stealMod = stealMod +2 end; --Rogue's Poulaines
	if(player:getEquipID(SLOT_FEET) == 15357) then stealMod = stealMod +2 end; --Rogue's Poulaines +1
	
	if(player:getEquipID(SLOT_MAIN) == 17623) then stealMod = stealMod +2 end; --Bartholomew's Knife
	if(player:getEquipID(SLOT_SUB) == 17623) then stealMod = stealMod +2 end; --Bartholomew's Knife
	if(rate < (50 + stealMod + thfLevel - target:getMainLvl())) then
		local stolen = target:getStealItem();
		player:addItem(stolen);
		player:messageBasic(125,41,stolen);
	else
		player:messageBasic(153,41);
	end
end;