-----------------------------------
--
-- Zone: Batallia_Downs (105)
--
-----------------------------------

package.loaded["scripts/zones/Batallia_Downs/TextIDs"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Batallia_Downs/TextIDs");

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
		player:setPos(-693.609,-14.583,173.59,30);
	end	
	if (player:getQuestStatus(WINDURST, I_CAN_HEAR_A_RAINBOW) == QUEST_ACCEPTED and player:hasItem(1125,0)) then	
		colors = player:getVar("ICanHearARainbow");
		o = (tonumber(colors) % 4 >= 2);
		y = (tonumber(colors) % 8 >= 4);
		i = (tonumber(colors) % 64 >= 32);
		cs = 0x0385;
       if (o == false and wc < 4) then
	        player:setVar("ICanHearARainbow_Weather",1);
	        player:setVar("ICanHearARainbow",colors+2);
		elseif (y == false and (wc == 8 or wc == 9)) then
			player:setVar("ICanHearARainbow_Weather",8);
			player:setVar("ICanHearARainbow",colors+4);
		elseif (i == false and (wc == 12 or wc == 13)) then
			player:setVar("ICanHearARainbow_Weather",12);
			player:setVar("ICanHearARainbow",colors+32);
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
	if (csid == 0x0385) then		
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
	if (csid == 0x0385) then		
		player:setVar("ICanHearARainbow_Weather",0);	
	end		
end;
