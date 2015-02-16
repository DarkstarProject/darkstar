-----------------------------------------
-- ID: 10293
-- Item: Chocobo Shirt
-- Effect: When used, you will obtain 4-10 of crystals of the day
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
	if (target:getFreeSlotsCount() == 0) then
		result = 308;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(4,10)
	if(VanadielDayElement() == 0) then -- Fireday
		target:addItem(4096,amount);
	elseif(VanadielDayElement() == 1) then -- Earthsday
		target:addItem(4099,amount);
	elseif(VanadielDayElement() == 2) then -- Watersday
		target:addItem(4101,amount);
	elseif(VanadielDayElement() == 3) then -- Windsday
		target:addItem(4098,amount);
	elseif(VanadielDayElement() == 4) then -- Iceday
		target:addItem(4097,amount);
	elseif(VanadielDayElement() == 5) then -- Lightningday
		target:addItem(4100,amount);
	elseif(VanadielDayElement() == 6) then -- Lightsday
		target:addItem(4102,amount);
	elseif(VanadielDayElement() == 7) then -- Darksday
		target:addItem(4103,amount);
	end
end;