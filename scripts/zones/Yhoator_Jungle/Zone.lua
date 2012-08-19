-----------------------------------
--
-- Zone: Yhoator_Jungle (124)
--
-----------------------------------

package.loaded["scripts/zones/Yhoator_Jungle/TextIDs"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Yhoator_Jungle/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)		
end;		

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)
	cs = -1;
	wc = player:getWeather();
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(299.997,-5.838,-622.998,190);
	end	
	if (player:getQuestStatus(WINDURST, I_CAN_HEAR_A_RAINBOW) == QUEST_ACCEPTED and player:hasItem(1125,0)) then	
		colors = player:getVar("ICanHearARainbow");
		r = (tonumber(colors) % 2 >= 1);
		o = (tonumber(colors) % 8 >= 4);
		b = (tonumber(colors) % 32 >= 16);	
		cs = 0x0002;	
		if (r == false and (wc == 4 or wc == 5)) then
			player:setVar("ICanHearARainbow_Weather",4);
			player:setVar("ICanHearARainbow",colors+1);
		elseif (o == false and wc < 4) then
			player:setVar("ICanHearARainbow_Weather",1);
			player:setVar("ICanHearARainbow",colors+2);
		elseif (b == false and (wc == 6 or wc == 7)) then	
			player:setVar("ICanHearARainbow_Weather",6);
			player:setVar("ICanHearARainbow",colors+16);
		else	
			cs = -1;
		end	
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
	if (csid == 0x0002) then		
		weather = player:getVar("ICanHearARainbow_Weather");	
		if (weather == 1) then	
			weather = 0;
		end	
		if (player:getVar("ICanHearARainbow") < 127) then	
			player:updateEvent(0,0,weather);
		else	
			player:updateEvent(0,0,weather,6);
		end	
	end		
end;			

-----------------------------------			
-- onEventFinish			
-----------------------------------			

function onEventFinish(player,csid,option)		
	--printf("CSID: %u",csid);	
	--printf("RESULT: %u",option);	
	if (csid == 0x0002) then	
		player:setVar("ICanHearARainbow_Weather",0);
	end	
end;		
