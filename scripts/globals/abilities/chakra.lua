-----------------------------------
-- Ability: Chakra
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	local hp = player:getHP();
	local vit = player:getStat(MOD_VIT);
	local multi = 2;
	
	local body = player:getEquipID(4);
	local hand = player:getEquipID(6);
	
	if(player:hasStatusEffect(EFFECT_POISON)) then
		player:delStatusEffect(EFFECT_POISON);
	end
	if(player:hasStatusEffect(EFFECT_BLINDNESS)) then
		player:delStatusEffect(EFFECT_BLINDNESS);
	end
	if((body == 12639) or (body == 14474)) then -- Temple Cyclas (+1) equipped
		if(player:hasStatusEffect(EFFECT_PARALYSIS)) then
			player:delStatusEffect(EFFECT_PARALYSIS);
		end
		multi = multi + 1;
	end
	if((hand == 15103) or (hand == 14910)) then -- Melee Gloves (+1) equipped
		if(player:hasStatusEffect(EFFECT_DISEASE)) then
			player:delStatusEffect(EFFECT_DISEASE);
		end
		multi = multi + 0.6;
	end
	local recover = (multi * vit);
	player:setHP((hp + recover));
	player:messageBasic(24,0,recover); -- <Player> <recovers/recover> <#> HP.
end;