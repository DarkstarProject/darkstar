-----------------------------------	
--	
-- Zone: Inner_Horutoto_Ruins (192)	
--	
-----------------------------------	

package.loaded["scripts/zones/Inner_Horutoto_Ruins/TextIDs"] = nil;	
require("scripts/globals/settings");	
require("scripts/zones/Inner_Horutoto_Ruins/TextIDs");	

-----------------------------------	
-- onInitialize	
-----------------------------------	

function onInitialize(zone)	
	zone:registerRegion(1, -262, -1, -32, -258, 1, -28); -- Red
	zone:registerRegion(2, -266, -1, -26, -262, 1, -22); -- White	
	zone:registerRegion(3, -258, -1, -26, -256, 1, -22); -- Black	
end;		

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
	cs = -1;	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(-259.996,6.399,242.859,67);
	end	
	return cs;	
end;		

-----------------------------------			
-- onRegionEnter			
-----------------------------------			

function onRegionEnter(player,region)			
	red   = GetNPCByID(17563858);		
	white = GetNPCByID(17563859);		
	black = GetNPCByID(17563860);		
	switch (region:GetRegionID()): caseof		
	{		
	[1] = function (x)  -- Red Circle		
	if (player:getMainJob() == 5 and region:AddCount(1) == 1) then		
		red:setAnimation(8);	
		if (white:getAnimation() == 8 and black:getAnimation() == 8) then	
			GetNPCByID(17563861):setAnimation(8);
			GetNPCByID(17563862):setAnimation(8);
		end	
	end		
	end,		
	[2] = function (x)  -- White Circle		
	if (player:getMainJob() == 3 and region:AddCount(1) == 1) then		
		white:setAnimation(8);	
		if (red:getAnimation() == 8 and black:getAnimation() == 8) then	
			GetNPCByID(17563861):setAnimation(8);
			GetNPCByID(17563862):setAnimation(8);
		end	
	end		
	end,		
	[3] = function (x)  -- Black Circle		
	if (player:getMainJob() == 4 and region:AddCount(1) == 1) then		
		black:setAnimation(8);	
		if (red:getAnimation() == 8 and white:getAnimation() == 8) then	
			GetNPCByID(17563861):setAnimation(8);
			GetNPCByID(17563862):setAnimation(8);
		end	
	end		
	end,		
	}		
end;			

-----------------------------------			
-- onRegionLeave			
-----------------------------------			

function onRegionLeave(player,region)			
	red   = GetNPCByID(17563858);		
	white = GetNPCByID(17563859);		
	black = GetNPCByID(17563860);		
	switch (region:GetRegionID()): caseof		
	{		
	[1] = function (x)  -- Red Circle		
	if (player:getMainJob() == 5 and region:DelCount(1) == 0) then		
		red:setAnimation(9);	
		if (white:getAnimation() == 8 and black:getAnimation() == 8) then	
			GetNPCByID(17563861):setAnimation(9);
			GetNPCByID(17563862):setAnimation(9);
		end	
	end		
	end,		
	[2] = function (x)  -- White Circle		
	if (player:getMainJob() == 3 and region:DelCount(1) == 0) then		
		white:setAnimation(9);	
		if (red:getAnimation() == 8 and black:getAnimation() == 8) then	
			GetNPCByID(17563861):setAnimation(9);
			GetNPCByID(17563862):setAnimation(9);
		end	
	end		
	end,		
	[3] = function (x)  -- Black Circle		
	if (player:getMainJob() == 4 and region:DelCount(1) == 0) then		
		black:setAnimation(9);	
		if (red:getAnimation() == 8 and white:getAnimation() == 8) then	
			GetNPCByID(17563861):setAnimation(9);
			GetNPCByID(17563862):setAnimation(9);
		end	
	end		
	end,		
	}		
end;			

-----------------------------------	
-- onEventUpdate	
-----------------------------------	

function onEventUpdate(player,csid,option)	
	--printf("CSID: %u",csid);
	--printf("RESULT: %u",option);
end;	

-----------------------------------	
-- onEventFinish	
-----------------------------------	

function onEventFinish(player,csid,option)	
	--printf("CSID: %u",csid);
	--printf("RESULT: %u",option);
end;
