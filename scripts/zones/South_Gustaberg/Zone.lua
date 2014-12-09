-----------------------------------
--
-- Zone: South_Gustaberg (107)
--
-----------------------------------

package.loaded["scripts/zones/South_Gustaberg/TextIDs"] = nil;
require("scripts/globals/zone");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/South_Gustaberg/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)		
    local manuals = {17216199,17216200};
    
    SetFieldManual(manuals);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
	local cs = -1;
	local wc = player:getWeather();
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
		player:setPos(-601.433,35.204,-520.031,1);
	end
	if(player:getCurrentMission(COP) == THE_CALL_OF_THE_WYRMKING and player:getVar("VowsDone") == 1)then
		cs= 0x038A;
	elseif (player:getQuestStatus(WINDURST, I_CAN_HEAR_A_RAINBOW) == QUEST_ACCEPTED and player:hasItem(1125,0)) then
		local colors = player:getVar("ICanHearARainbow");
		local o = (tonumber(colors) % 4 >= 2);
		cs = 0x0385;
		if (o == false and wc < 4) then
			player:setVar("ICanHearARainbow_Weather",1);
			player:setVar("ICanHearARainbow",colors+2);
		else
			cs = -1;
		end
	end
	return cs;
end;


-----------------------------------		
-- onConquestUpdate		
-----------------------------------		

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();
    
    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
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
	if(csid == 0x038A) then
		if (player:getCurrentMission(COP) == A_TRANSIENT_DREAM)then
			player:completeMission(COP,A_TRANSIENT_DREAM);
			player:addMission(COP,THE_CALL_OF_THE_WYRMKING);
		end
		player:setVar("VowsDone",0);
	elseif (csid == 0x0385) then
		player:setVar("ICanHearARainbow_Weather",0);
	end
end;
