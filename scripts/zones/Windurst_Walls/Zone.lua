-----------------------------------	
--	
-- Zone: Windurst_Walls (239)	
--	
-----------------------------------	

package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;	
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/settings");	
require("scripts/zones/Windurst_Walls/TextIDs");	

-----------------------------------	
-- onInitialize	
-----------------------------------	

function onInitialize(zone)	
	zone:registerRegion(1, -2,-17,140, 2,-16,142);
	zone:registerRegion(2, 120,-3,110, 123,-2,117); -- Shantotto's House 
	
end;			

-----------------------------------			
-- onZoneIn			
-----------------------------------			

function onZoneIn(player,prevZone)			
	cs = -1;		
	-- MOG HOUSE EXIT		
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then		
		position = math.random(1,5) - 123;	
		player:setPos(-257.5,-5.05,position,0);	
		if (player:getMainJob() ~= player:getVar("PlayerMainJob")) then	
			cs = 0x7534;
		end	
		player:setVar("PlayerMainJob",0);	
	end
	return cs;
end;	

-----------------------------------	
-- onRegionEnter	
-----------------------------------	

function onRegionEnter(player,region)	
	switch (region:GetRegionID()): caseof
	{
	[1] = function (x)  -- Heaven's Tower enter portal
	player:startEvent(0x56);
	end,
    [2] = function (x)  -- Shantotto's House
	foiledAgain = player:getQuestStatus(WINDURST,CURSES_FOILED_AGAIN_1);
	
	if(foiledAgain == QUEST_AVAILABLE) then
		player:startEvent(0xab,0,0,0,0,0,0,928,880);
	elseif(foiledAgain == QUEST_COMPLETED) then
	    cDay = VanadielDayOfTheYear();
		cYear = VanadielYear();
		dFinished = player:getVar("Curses,FoiledAgain!DayFinished");
		yFinished = player:getVar("Curses,FoiledAgain!YearFinished");
		if(cDay == dFinished and cYear == yFinished) then
		    player:startEvent(0xae);
		elseif(cDay == dFinished + 1 and cYear == yFinished) then
            player:startEvent(0xb2);
		elseif(cDay >= dFinished + 2 and cYear == yFinished) then
			player:startEvent(0xb3);

			
		end	
	elseif(foiledAgain == QUEST_ACCEPTED) then
		player:startEvent(0xac,0,0,0,0,0,0,928,880);
	else
		player:startEvent(0xa4);
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
	if (csid == 0x56) then	
		player:setPos(0,0,-22.40,192,242);
	elseif (csid == 0x7534 and option == 0) then	
		player:setHomePoint();
		player:messageSpecial(HOMEPOINT_SET);
	elseif(csid == 0xab and option ~= 1) then
		player:addQuest(WINDURST,CURSES_FOILED_AGAIN_1);
	elseif(csid == 0xb3) then
		player:setVar("Curses,FoiledAgain!DayFinished",0);
	    player:setVar("Curses,FoiledAgain!YearFinished",0);
		player:needToZone(true);
        player:setVar("Curses,FoiledAgain!?",1); -- Used to acknowledge that the two days have passed, Use this to initiate next quest 

	end	
end;		
