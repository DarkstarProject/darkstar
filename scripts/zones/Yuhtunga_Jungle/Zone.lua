-----------------------------------
--
-- Zone: Yuhtunga_Jungle (123)
--
-----------------------------------

package.loaded["scripts/zones/Yuhtunga_Jungle/TextIDs"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Yuhtunga_Jungle/TextIDs");

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
		player:setPos(116.825,6.613,100,140);
	end	
	if (player:getQuestStatus(WINDURST, I_CAN_HEAR_A_RAINBOW) == QUEST_ACCEPTED and player:hasItem(1125,0)) then	
		colors = player:getVar("ICanHearARainbow");
		o = (tonumber(colors) % 4 >= 2);
		r = (tonumber(colors) % 2 >= 1);
		b = (tonumber(colors) % 32 >= 16);
		cs = 0x000b;
		if (o == false and wc < 4) then
           player:setVar("ICanHearARainbow_Weather",1);
           player:setVar("ICanHearARainbow",colors+2);
		elseif (r == false and (wc == 4 or wc == 5)) then
			player:setVar("ICanHearARainbow_Weather",4);
			player:setVar("ICanHearARainbow",colors+1);
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
	if (csid == 0x000b) then		
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
	if (csid == 0x000b) then		
		player:setVar("ICanHearARainbow_Weather",0);	
	end		
end;
