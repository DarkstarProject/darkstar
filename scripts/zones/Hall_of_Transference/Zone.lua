-----------------------------------
-- 
-- Zone: Hall_of_Transference
-- 
-----------------------------------
package.loaded["scripts/zones/Hall_of_Transference/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Hall_of_Transference/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
	zone:registerRegion(1,276,-84,-82,283,-80,-75);
	zone:registerRegion(2,0,0,0,0,0,0);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
cs = -1;
	
	if((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(274,-82,-62 ,180);
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
			player:setVar("option",1);
			player:startEvent(103);
		end,
		[2] = function (x)
			player:setVar("option",2);
			player:startEvent(103);
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

	if(csid==103)then 
	player:setVar("option",0);
		
		if(option==1)then
			local lastp = player:getVar("Stelepoint");
			player:setVar("Stelepoint",0);
			if(lastp == 1 or lastp == 2) then -- konshtat or promy dem
				player:setPos(136 ,19 ,220 ,130 ,108 ); -- teleport to konshtat 
			elseif(lastp == 3 or lastp == 4) then -- theine or promy holla
				player:setPos(337 ,19 ,-60 ,125 ,102 ); -- teleport to la theine 
			else   -- tahrongi or promy mea   ( lastp==5 or lastp==6)          
				player:setPos(179 ,35 ,256 ,63 ,117 ); -- teleport to tahrongi 			 
			end
       end
   end

end;