-----------------------------------
--
-- Zone: Promyvion-Holla (16)
--
-----------------------------------
package.loaded["scripts/zones/Promyvion-Holla/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/missions");
require("scripts/zones/Promyvion-Holla/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
	
	zone:registerRegion(1,  78, -4,  78,  82, 4, 82); 		-- exit Promyvion - Holla (J-7)
	zone:registerRegion(2, -42, -4, 198, -38, 4, 202); 		-- Level 1 MR spawn point (I-6)
	
	--zone:registerRegion(3,  -2, -4, -42,   2, 4, -38); 		-- Level 2 MR spawn point (I-9) no receptacle
	zone:registerRegion(4, -162, -4, -202, -157, 4, -198);	-- Level 2 MR spawn point (G-11)
	zone:registerRegion(5, -282, -4, -42, -278, 4, -38);	-- Level 2 MR spawn point (F-9)
	zone:registerRegion(6, -240, -4,  38, -237, 4, 41); 	-- Level 2 MR spawn point (F-8)
	zone:registerRegion(7, -122, -4,  -2, -118, 4, 2); 		-- Level 2 porter down to Level 1 (H-8)
	
	zone:registerRegion(8, -162, -4, 118, -158, 4, 122); 	-- Level 3 west porter down to Level 2 (G-7)
	zone:registerRegion(9, -362, -4, 118, -358, 4, 122); 	-- Level 3 MR spawn point D/E-7
	zone:registerRegion(10, -362, -4, 237, -358, 4, 242); 	-- Level 3 MR spawn point D/E-5
	zone:registerRegion(11, -282, -4, 277, -278, 4, 282); 	-- Level 3 MR spawn point E/F-5
	zone:registerRegion(12, 158, -4, 238, 162, 4, 242); 	-- Level 3 east Porter down to Level 2 (K-5)
	zone:registerRegion(13, 278, -4, 197, 282, 4, 202); 	-- Level 3 MR spawn point M-6
	zone:registerRegion(14,  38, -4, 318,  42, 4, 322); 	-- Level 3 MR spawn point J-4
	zone:registerRegion(15, 158, -4, 358, 162, 4, 362); 	-- Level 3 MR spawn point K-4
	
	zone:registerRegion(16, 118, -4,-322, 121, 4,-318); 	-- Level 4 Porter down to Level 3 (K-12)
	
 end;		

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
cs = -1;
	
	if(player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then	
		player:setPos(20,-2.1,63.031,192);
	end
	
	if(player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") == 2) then
	    player:completeMission(COP,BELOW_THE_ARKS);
		player:addMission(COP,THE_MOTHERCRYSTALS); -- start mission 1.3
		player:setVar("PromathiaStatus",0);
	end
	
	-- First enter in promy holla
	if(player:getVar("FirstPromyvionHolla") == 1)then
		player:setVar("FirstPromyvionHolla",0);
		cs = 0x0032;
	end
	
	-- ZONE LEVEL RESTRICTION
	player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,30,0,0);
	
	return cs;	
end;

-----------------------------------	
-- onRegionEnter	
-----------------------------------	

function onRegionEnter(player,region)
--regionID =region:GetRegionID();
--printf("regionID: %u",regionID);
	
	switch (region:GetRegionID()): caseof {
	
		[1] = function (x) player:startEvent(0x002E); end,
		[2] = function (x) 
			if(GetMobAction(16842781) == 24) then 
				player:startEvent(0x0025); 
			end
		end,
		[3] = function (x) 
			if(GetMobAction(16840000) == 24) then 
				if(math.random() >= 0.5) then
					player:startEvent(0x0021);
				else
					player:startEvent(0x0022);
				end
			end
		end,
		[4] = function (x)
			if(GetMobAction(16842853) == 24) then 
				if(math.random() >= 0.5) then
					player:startEvent(0x0021);
				else
					player:startEvent(0x0022);
				end
			end
		end,
		[5] = function (x)
			if(GetMobAction(16842846) == 24) then 
				if(math.random() >= 0.5) then
					player:startEvent(0x0021);
				else
					player:startEvent(0x0022);
				end
			end
		end,
		[6] = function (x)
			if(GetMobAction(16842839) == 24) then 
				if(math.random() >= 0.5) then
					player:startEvent(0x0021);
				else
					player:startEvent(0x0022);
				end
			end
		end,
		[7] = function (x) player:startEvent(0x0029); end,
		[8] = function (x) player:startEvent(0x002A); end,
		[9] = function (x) 
			if(GetMobAction(16842904) == 24) then 
				player:startEvent(0x001E); 
			end
		end,
		[10] = function (x) 
			if(GetMobAction(16842895) == 24) then 
				player:startEvent(0x001E); 
			end
		end,
		[11] = function (x) 
			if(GetMobAction(16842886) == 24) then 
				player:startEvent(0x001E); 
			end
		end,
		[12] = function (x)	player:startEvent(0x002A); end,
		[13] = function (x) 
			if(GetMobAction(16842956) == 24) then 
				player:startEvent(0x001E); 
			end
		end,
		[14] = function (x) 
			if(GetMobAction(16842938) == 24) then 
				player:startEvent(0x001E); 
			end
		end,
		[15] = function (x) 
			if(GetMobAction(16842947) == 24) then 
				player:startEvent(0x001E); 
			end
		end,
		[16] = function (x)
			if(math.random() >= 0.5) then
				player:startEvent(0x002B);
			else
				player:startEvent(0x002C);
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
	
	if(csid == 0x002E and option == 1) then
		player:setVar("Stelepoint",4);
		player:setPos(274 ,-82 ,-62 ,180 ,14); -- -> back to Hall of Transferance
    end
	
end;	