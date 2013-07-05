-----------------------------------
--
-- Zone: Lufaise_Meadows (24)
--
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)

	local Colorful_Leshy = 16875762;
	GetMobByID(Colorful_Leshy):setExtraVar(os.time() + math.random((43200), (86400)));

end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
cs = -1;	
	
	if(player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then	
		player:setPos(-475.825,-20.461,281.149,11);
	end
	
	if(player:getCurrentMission(COP) == AN_INVITATION_WEST and player:getVar("PromathiaStatus") == 1) then
		cs = 0x006E;
	elseif(player:getCurrentMission(COP) == CHAINS_AND_BONDS and player:getVar("PromathiaStatus") == 0) then
        cs = 0x006F;	
	end
	
	return cs;	
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
	if (csid == 0x006E) then
		player:setVar("PromathiaStatus",2);
    elseif(csid == 0x006F)then
		player:addItem(14657);
		player:setVar("PromathiaStatus",1);
	end
end;