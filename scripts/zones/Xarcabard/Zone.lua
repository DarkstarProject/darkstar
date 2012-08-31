-----------------------------------
--
-- Zone: Xarcabard (112)
--
-----------------------------------

package.loaded["scripts/zones/Xarcabard/TextIDs"] = nil;
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/zones/Xarcabard/TextIDs");

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
		player:setPos(-136.287,-23.268,137.302,91);
	end	
	if(player:hasKeyItem(VIAL_OF_SHROUDED_SAND) == false and player:getRank() >= 6 and player:getMainLvl() >= 65 and player:getVar("Dynamis_Status") == 0) then
		player:setVar("Dynamis_Status",1);
		print("Player can now enter Dynamis.");
		cs = 0x000D; 
	elseif(player:getQuestStatus(WINDURST, I_CAN_HEAR_A_RAINBOW) == QUEST_ACCEPTED and player:hasItem(1125,0)) then	
		colors = player:getVar("ICanHearARainbow");
		i = (tonumber(colors) % 64 >= 32);
		o = (tonumber(colors) % 4 >= 2);
		cs = 0x0009;
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
	if (csid == 0x0009) then		
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
	if (csid == 0x0009) then	
		player:setVar("ICanHearARainbow_Weather",0);
	end	
end;		
