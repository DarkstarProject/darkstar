-----------------------------------
-- Area: 
-- NPC:  Airship_Door (instance 3)
-----------------------------------
package.loaded["scripts/zones/Sealions_Den/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/missions");
require("scripts/zones/Sealions_Den/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)  
	   player:startEvent(0x7d03,3);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
	
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)

--printf("option: %u",option);
local mammet_3_1=GetMobAction(16908303);
local mammet_3_2=GetMobAction(16908304);
local mammet_3_3=GetMobAction(16908305);
local mammet_3_4=GetMobAction(16908306);
local mammet_3_5=GetMobAction(16908307);
local omega3=GetMobAction(16908308);
local ultima3=GetMobAction(16908309);

	if(csid ==0x7d03 and option==102)then -- instance 3
	  if(mammet_3_1 > 0 or mammet_3_2 > 0 or mammet_3_3 > 0 or mammet_3_4 > 0 or mammet_3_5 > 0)then--on check si il y as un mammet en vie
	     player:startEvent(0x0000,3);		 
	  elseif(omega3 > 0)then--on check si il y as omega envie
	     player:startEvent(0x0001,3);
	  elseif(ultima3 > 0)then--on check si il y as omega envie
	     player:startEvent(0x0002,3);
	  end
	end
	
end;