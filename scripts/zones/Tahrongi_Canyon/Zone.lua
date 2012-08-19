-----------------------------------
--
-- Zone: Tahrongi_Canyon (117)
--
-----------------------------------

package.loaded["scripts/zones/Tahrongi_Canyon/TextIDs"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Tahrongi_Canyon/TextIDs");

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
		player:setPos(442.781,-1.641,-40.144,160);
	end	
	if (player:getQuestStatus(WINDURST, I_CAN_HEAR_A_RAINBOW) == QUEST_ACCEPTED and player:hasItem(1125,0)) then	
		colors = player:getVar("ICanHearARainbow");
		o = (tonumber(colors) % 4 >= 2);
		y = (tonumber(colors) % 8 >= 4);
		g = (tonumber(colors) % 16 >= 8);
		cs = 0x0023;
		if (o == false and wc < 4) then
           player:setVar("ICanHearARainbow_Weather",1);
	        player:setVar("ICanHearARainbow",colors+2);
		elseif (y == false and (wc == 8 or wc == 9)) then
			player:setVar("ICanHearARainbow_Weather",8);
			player:setVar("ICanHearARainbow",colors+4);
		elseif (g == false and (wc == 10 or wc == 11)) then
			player:setVar("ICanHearARainbow_Weather",10);
			player:setVar("ICanHearARainbow",colors+8);
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
	if (csid == 0x0023) then		
		weather = player:getVar("ICanHearARainbow_Weather");	
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
	if (csid == 0x0023) then		
		player:setVar("ICanHearARainbow_Weather",0);	
	end		
end;
