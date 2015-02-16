-----------------------------------------
-- ID: 5257
-- Item: Blaze Feather
-- Effect: Blaze Spikes
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	result = 0;
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local legs = target:getEquipID(SLOT_LEGS);
	local int = target:getStat(MOD_INT);
	local magicAtk = target:getMod(MOD_MATT);
	local power = ((int + 2) / 12 + 4) * (1 + (magicAtk / 100));
	    
  	-- Equipment Bonus Amount
    	if (legs == 15622) then -- Mercenarys Trousers
    		power = ((int + 2) / 12 + 4) * (1 + (magicAtk / 100)) + (int * (4/256));
	elseif (legs == 15121 or legs == 15584) then -- Duelist Tights & +1
    		power = ((int + 2) / 12 + 4) * (1 + (magicAtk / 100)) + (int * (6/256));
	elseif (legs == 10714) then -- Duelist Tights +2
		power = ((int + 2) / 12 + 4) * (1 + (magicAtk / 100)) + (int * (8/256));
	end

	if(target:addStatusEffect(EFFECT_BLAZE_SPIKES,power,0,90)) then
		target:messageBasic(205);
	else
        	target:messageBasic(423); -- no effect
        end
end;