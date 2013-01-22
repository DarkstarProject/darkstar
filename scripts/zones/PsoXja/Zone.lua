-----------------------------------
--
-- Zone: PsoXja (9)
--
-----------------------------------

package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/zones/PsoXja/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
zone:registerRegion(1,-26,-2,17,-24,2,22);--up enter
zone:registerRegion(2,-23,-2,17,-20,2,22);--up exit
zone:registerRegion(3,-21,30,24,-18,34,27); --dowwn enter
zone:registerRegion(4,-21,30,22,-18,34,24);--dowwn exit

end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
	cs = -1;	
	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(-29.956,-1.903,212.521,188);
	end
	if(ENABLE_COP_ZONE_CAP == 1)then
         local LVLcap = player:getVar("PSOXJA_RESTRICTION_LVL");
	       if (LVLcap > 0)then
             player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,LVLcap,0,0);-- ZONE LEVEL RESTRICTION
           end
     end
	
	return cs;	
end;		

-----------------------------------		
-- onRegionEnter		
-----------------------------------		

function onRegionEnter(player,region)	
--print(region:GetRegionID());
 ----------elevator to the Shrouded maw temporary solution
	switch (region:GetRegionID()): caseof
	{
		[1] = function (x)
		player:setPos(-19,0,20,55);
		end,
		[2] = function (x) 
		player:setPos(-29,0,20,130);
		end,
		[3] = function (x)
		player:setPos(-19,32,20,55);
		end,
		[4] = function (x)
		player:setPos(-19,32,30,55);
		end,
	}
----------------------------------------------------------------

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
end;	
