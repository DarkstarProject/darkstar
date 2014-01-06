-----------------------------------
--
-- Zone: Aht_Urhgan_Whitegate (50)
--
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
	zone:registerRegion(1,57,-1,-70,62,1,-65); -- Sets Mark for "Got It All" Quest cutscene.
	zone:registerRegion(2,-96,-7,121,-64,-5,137); -- Sets Mark for "Vanishing Act" Quest cutscene.
end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
	local cs = -1;	
	-- MOG HOUSE EXIT	
	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
		if(prevZone == 46) then		
			cs = 0x00c9;
		elseif(prevZone == 59) then
			cs = 0x00cc;
		elseif(prevZone == 58) then
			cs = 0x00cc;
		else 
			local position = math.random(1,5) - 83;
			player:setPos(-100,0,position,0);
		end
	end
return cs;	

end;		

-----------------------------------	
-- onRegionEnter	
-----------------------------------	

function onRegionEnter(player,region)	
	switch (region:GetRegionID()): caseof
	{
	[1] = function (x)  -- Cutscene for Got It All quest.
	if(player:getVar("gotitallCS") == 5)then
		player:startEvent(0x020e);
	end
	end,
	[2] = function (x) -- CS for Vanishing Act Quest
	if(player:getVar("vanishingactCS") == 3) then
	    player:startEvent(0x002c);
	end
	end,
	}
end;	

-----------------------------------	
-- onRegionLeave	
-----------------------------------	

function onRegionLeave(player,region)	
end;	

-----------------------------------		
-- onTransportEvent		
-----------------------------------		

function onTransportEvent(player,transport)
	if ((transport == 46) or (transport == 47)) then 
		player:startEvent(0x00c8);
	elseif (transport == 58) or (transport == 59) then 
		player:startEvent(0x00cb);
    end
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
	if(csid == 0x00c9)then
		player:setPos(-11,2,-142,192);
	elseif(csid == 0x00cc)then
		player:setPos(11,2,142,64);
	elseif(csid == 0x00c8) then
		player:setPos(0,-2,0,0,47);
	elseif(csid == 0x00cb) then
		player:setPos(0,-2,0,0,58);
	elseif(csid == 0x002c)then
		player:setVar("vanishingactCS",4);
		player:setPos(-80,-6,122,5);
	elseif(csid == 0x020e)then
		player:setVar("gotitallCS",6);
		player:setPos(60,0,-71,38);
	end
end;
