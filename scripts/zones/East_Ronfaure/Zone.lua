-----------------------------------
--
-- Zone: East_Ronfaure
--
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/East_Ronfaure/TextIDs"] = nil;
require("scripts/zones/East_Ronfaure/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)		
end;		

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
	cs = -1;	

	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(200.015,-3.187,-536.074,187);
	end	
	if (player:getQuestStatus(WINDURST, I_CAN_HEAR_A_RAINBOW) == 1 and player:hasItem(1125)) then	
		colors = player:getVar("ICanHearARainbow");
		o = (tonumber(colors) % 4 >= 2);
		cs = 0x0015;	
		if (o == false) then	
			player:setVar("ICanHearARainbow_Weather",1);
			player:setVar("ICanHearARainbow",colors+2);
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

function onEventUpdate(player,csid,menuchoice)			
	--print("CSID: ",csid);		
	--print("RESULT: ",menuchoice);		
	if (csid == 0x0015) then		
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

function onEventFinish(player,csid,menuchoice)			
	--print("CSID: ",csid);		
	--print("RESULT: ",menuchoice);		
	if (csid == 0x0015) then		
		player:setVar("ICanHearARainbow_Weather",0);	
	end		
end;
