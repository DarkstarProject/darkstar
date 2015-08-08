-----------------------------------
--
-- Zone: Upper_Delkfutts_Tower (158)
--
-----------------------------------
package.loaded["scripts/zones/Upper_Delkfutts_Tower/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/common");
require("scripts/globals/zone");
require("scripts/globals/settings");
require("scripts/globals/teleports");
require("scripts/zones/Upper_Delkfutts_Tower/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)

    local tomes = {17424560,17424561,17424562};
    
    SetGroundsTome(tomes);    

	zone:registerRegion(1, -369, -146, 83,  -365, -145,  89); -- Tenth Floor F-6 porter to Middle Delkfutt's Tower	
	zone:registerRegion(2, -369, -178, -49, -365, -177, -43); -- Twelfth Floor F-10 porter to Stellar Fulcrum	
	
    UpdateTreasureSpawnPoint(17424559);

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
		player:setPos(12.098,-105.408,27.683,239);
	end	
	return cs;	
end;	

-----------------------------------	
-- onRegionEnter	
-----------------------------------	

function onRegionEnter(player,region)	
	switch (region:GetRegionID()): caseof
	{
	[1] = function (x)
	--player:setVar("porter_lock",1);
	player:startEvent(0);
	end,
	[2] = function (x)
	--player:setVar("porter_lock",1);
	player:startEvent(1);
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
	if (csid == 0 and option == 1) then	
		player:setPos(-490, -130, 81, 231, 157);
	elseif (csid == 1 and option == 1) then	
		player:setPos(-520 , 1 , -23, 192, 0xB3); -- to stellar fulcrum
	end	
end;
