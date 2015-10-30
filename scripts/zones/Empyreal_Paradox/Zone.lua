-----------------------------------
-- 
-- Zone: Empyreal_Paradox
-- 
-----------------------------------
package.loaded["scripts/zones/Empyreal_Paradox/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Empyreal_Paradox/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
	zone:registerRegion(1, 538, -2, -501,  542, 0, -497); -- to The Garden of Ru'hmet
end;

-----------------------------------		
-- onConquestUpdate		
-----------------------------------		

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();
    
    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;


-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
	local cs = -1;	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		--player:setPos(502,0,500,222); -- BC Area
		player:setPos(539,-1,-500,69);
	end	
	return cs;	
end;

-----------------------------------
-- onRegionEnter          
-----------------------------------

function onRegionEnter(player,region)
	
	switch (region:GetRegionID()): caseof
	{
		[1] = function (x) player:startEvent(0x0064); end,
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
	
	if (csid == 0x0064 and option == 1) then
		player:setPos(-420,-1,379.900,62,0x23);
	end
	
end;