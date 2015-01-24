-----------------------------------------
-- ID: 17961
-- Item: Lion Tamer
-- Effect: Pet DEF +10
-- Enchantment: "Enfire"
-- Charges: 50 Reuse: 300 Secs
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_MAIN) == 17961 or target:getEquipID(SLOT_SUB) == 17961) then
		pet:addMod(MOD_DEF, 10);
	else
		pet:delMod(MOD_DEF, 10);
	end
	return 0;
end;
-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	effect = EFFECT_ENFIRE;
	doEnspell(target,target,nil,effect);
end;
