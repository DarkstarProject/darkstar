-----------------------------------
--
-- Zone: La_Theine_Plateau (102)
--
-----------------------------------

package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/La_Theine_Plateau/TextIDs");

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
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(-272.118,21.715,98.859,243);
	end	
	if(player:getQuestStatus(WINDURST, I_CAN_HEAR_A_RAINBOW) == QUEST_ACCEPTED and player:hasItem(1125)) then	
		colors = player:getVar("ICanHearARainbow");
		g = (tonumber(colors) % 16 >= 8);
		b = (tonumber(colors) % 32 >= 16);
		cs = 0x007b;
		if(g == false) then	
			player:setVar("ICanHearARainbow_Weather",10);
			player:setVar("ICanHearARainbow",colors+8);
		elseif(b == false) then	
			player:setVar("ICanHearARainbow_Weather",6);
			player:setVar("ICanHearARainbow",colors+16);
		else	
			cs = -1;
		end	
	elseif(prevZone == 193 and player:getVar("darkPuppetCS") == 5 and player:getFreeSlotsCount() >= 1) then		
		cs = 0x007a;	
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
	if(csid == 0x007b) then	
		weather = player:getVar("ICanHearARainbow_Weather");
		if(player:getVar("ICanHearARainbow") < 127) then
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
	if(csid == 0x007b) then		
		player:setVar("ICanHearARainbow_Weather",0);	
	elseif(csid == 0x007a) then	
		player:addItem(14096);
		player:messageSpecial(ITEM_OBTAINED,14096); -- Chaos Sollerets
		player:setVar("darkPuppetCS",0);
		player:addFame(BASTOK,AF2_FAME);
		player:completeQuest(BASTOK,DARK_PUPPET);
	end	
end;		
