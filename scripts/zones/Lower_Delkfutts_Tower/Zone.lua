-----------------------------------
--
-- Zone: Lower_Delkfutts_Tower
--
-----------------------------------

package.loaded["scripts/zones/Lower_Delkfutts_Tower/TextIDs"] = nil;

-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Lower_Delkfutts_Tower/TextIDs");
-----------------------------------

--  onInitialize

-----------------------------------
function onInitialize(zone)		
	zone:registerRegion(1, 403, -34, 83, 409, -33, 89); -- Third Floor G-6 porter to Middle Delkfutt's Tower	
	zone:registerRegion(2, 390, -34, -49, 397, -33, -43); -- Third Floor F-10 porter to Middle Delkfutt's Tower "1"	
	--print("Lower Delkfutt's Tower Teleporters initialized.")	
end;		
-----------------------------------		

-- onZoneIn		

-----------------------------------		
function onZoneIn(player,prevZone)		
	cs = -1;	

	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(460.022,-1.77,-103.442,188);
	end	
	return cs;
end;	
-----------------------------------	

-- onRegionEnter	

-----------------------------------	
function onRegionEnter(player,region)	

	switch (region:GetRegionID()): caseof
	{
	---------------------------------
	[1] = function (x)
	---------------------------------
	player:setVar("option",1);
	player:startEvent(4);
	end,
	---------------------------------
	[2] = function (x)
	---------------------------------
	player:setVar("option",2);
	player:startEvent(4);
	end,
	}

end;	
-----------------------------------	

-- onRegionLeave	

-----------------------------------	
function onRegionLeave(player,region)	
end;	
-----------------------------------	

-- onEventUpdate	

-----------------------------------	
function onEventUpdate(player,csid,menuchoice)	
	--print("CSID: ",csid);
	--print("RESULT: ",menuchoice);
end;	
-----------------------------------	

-- onEventFinish	

-----------------------------------	
function onEventFinish(player,csid,menuchoice)	
	--print("CSID: ",csid);		
	--print("RESULT: ",menuchoice);		

	if(menuchoice == 1) then		
		if(player:getVar("option") == 1) then	
			player:setPos(-28, -48, 80, 111, 157);
			else
			player:setPos(-51, -48, -40, 246, 157);
		end	
		player:setVar("option",0);	
		elseif(menuchoice == 0 or menuchoice >= 3) then	
		player:setVar("option",0);	
	end		

end;			
