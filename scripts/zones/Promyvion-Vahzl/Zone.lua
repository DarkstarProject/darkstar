-----------------------------------
--
-- Zone: Promyvion-Vahzl (22)
--
-----------------------------------
package.loaded["scripts/zones/Promyvion-Vahzl/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/zones/Promyvion-Vahzl/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
zone:registerRegion(10, -2,-2,-122, 2,2,-117); --  pxo xja 45
zone:registerRegion(11, 76,-2,-43, 82,2,-37);
zone:registerRegion(12, -43,-2,-362, -36,2,-356);

zone:registerRegion(20, -40,-2,197, -37,2,202);  -- lvl 1  41
zone:registerRegion(21, -163,-2,197, -156,2,203);  
zone:registerRegion(22, -162,-2,117, -156,2,123);
 
zone:registerRegion(30, 317,-2,-282, 322,2,-277);  --lvl2   42  
zone:registerRegion(31, 236,-2,-43, 243,2,-36);
zone:registerRegion(32, 356,-2,-82, 362,2,-76);
zone:registerRegion(33, 155,-2,-163, 163,2,-156);
zone:registerRegion(34, 236,-2,-243, 243,2,-236);

zone:registerRegion(40, 277,-2,38, 282,2,42);  --lvl3    43  
zone:registerRegion(41, 436,-2,276, 443,2,283);
zone:registerRegion(42, 116,-2,37, 122,2,42);
zone:registerRegion(43, 435,-2,38, 443,2,41);

zone:registerRegion(50, -42,-2,-2, -36,2,2);  --lvl4 44 35 36 37 38
end;		

--34 39 40

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
	local cs = -1;	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(-14.744,0.036,-119.736,1); -- To Floor 1 {R}
	end	
	
	if (player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==0) then
		cs = 0x0032;	
    elseif (ENABLE_COP_ZONE_CAP == 1) then
		player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,50,0,0);-- ZONE LEVEL RESTRICTION	
	end
	return cs;	
end;		

-----------------------------------	
-- onRegionEnter	
-----------------------------------	

function onRegionEnter(player,region)
	local regionID =region:GetRegionID();
	-- printf("regionID: %u",regionID);
	if (player:getAnimation()==0) then
	switch (region:GetRegionID()): caseof
	{
		[10] = function (x) player:startEvent(0x002D); end,--ok
		[11] = function (x) 
			if (GetNPCByID(16867700):getAnimation() == 8) then 
				player:startEvent(32);--ok 
			end
		end,
		[12] = function (x) 
		     if (GetNPCByID(16867699):getAnimation() == 8) then 
	            player:startEvent(33); end --ok
		     end,
		[20] = function (x)player:startEvent(41);end,--ok
		
		[21] = function (x)
			if (GetNPCByID(16867697):getAnimation() == 8) then 
				player:startEvent(30);--ok
			end
		end,
		[22] = function (x)
			if (GetNPCByID(16867698):getAnimation() == 8) then
				player:startEvent(31);--ok  
			end
		end,
		[30] = function (x) player:startEvent(42);end,
		
		[31] = function (x) 
		    if (GetNPCByID(16867703):getAnimation() == 8) then
	            player:startEvent(35); --ok
            end
        end,
		[32] = function (x) 
			if (GetNPCByID(16867705):getAnimation() == 8) then 
				player:startEvent(36);
			end
		end,
		[33] = function (x) 
			if (GetNPCByID(16867702):getAnimation() == 8) then 
				player:startEvent(37); 
		    end
		end,
		[34] = function (x) 
			if (GetNPCByID(16867704):getAnimation() == 8) then 
				player:startEvent(38); 
			end
		end,
		[40] = function (x) player:startEvent(43); end,
		[41] = function (x) 
			if (GetNPCByID(16867707):getAnimation() == 8) then 
				player:startEvent(34); 
			end
		end,
		[42] = function (x) 
			if (GetNPCByID(16867701):getAnimation() == 8) then 
				player:startEvent(39); 
			end
		end,
		[43] = function (x) 
			if (GetNPCByID(16867706):getAnimation() == 8) then 
				player:startEvent(40); 
			end
		end,
		[50] = function (x) player:startEvent(44);end,
	}	
	end
end;
	
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
	if (csid ==0x0032) then
		player:setVar("PromathiaStatus",1);
		if (ENABLE_COP_ZONE_CAP == 1) then
			player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,50,0,0);-- ZONE LEVEL RESTRICTION
		end
	elseif (csid ==0x002D and option == 1) then
		player:setPos(-379.947, 48.045, 334.059, 192, 9); -- To Pso'Xja {R}
	end
end;	
