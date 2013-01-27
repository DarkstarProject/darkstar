-----------------------------------
--
-- Zone: Beaucedine_Glacier (111)
--
-----------------------------------

package.loaded["scripts/zones/Beaucedine_Glacier/TextIDs"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Beaucedine_Glacier/TextIDs");
require("scripts/globals/missions");
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
		player:setPos(-247.911,-82.165,260.207,248);
	end	
	if (player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==9)then
	      cs=0x00CE;
	elseif (player:getQuestStatus(WINDURST, I_CAN_HEAR_A_RAINBOW) == QUEST_ACCEPTED and player:hasItem(1125,0)) then	
		colors = player:getVar("ICanHearARainbow");
		i = (tonumber(colors) % 64 >= 32);
		o = (tonumber(colors) % 4 >= 2);
		cs = 0x0072;
		if (o == false and wc < 4) then
	        player:setVar("ICanHearARainbow_Weather",1);
	        player:setVar("ICanHearARainbow",colors+2);
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
	if (csid == 0x0072) then		
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
	if (csid == 0x0072) then	
		player:setVar("ICanHearARainbow_Weather",0);
    elseif(csid == 0x00CE)then
	player:setVar("PromathiaStatus",10);
	end	
end;		
