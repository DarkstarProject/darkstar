-----------------------------------
--
-- Zone: Bhaflau_Thickets (52)
--
-----------------------------------

package.loaded["scripts/zones/Bhaflau_Thickets/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/zones/Bhaflau_Thickets/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)

    -- Harvestman
    SetRespawnTime(16990252, 900, 10800);

end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
	cs = -1;	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(-100,-13.5,-479.514,60);
	end	
	return cs;	
end;		

-----------------------------------		
-- afterZoneIn		
-----------------------------------		

function afterZoneIn(player)
    player:entityVisualPacket("1pb1");
    player:entityVisualPacket("2pb1");
end;

-----------------------------------		
-- onRegionEnter		
-----------------------------------		

function onRegionEnter(player,region)	
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
