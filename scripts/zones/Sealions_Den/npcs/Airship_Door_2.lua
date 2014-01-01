-----------------------------------
-- Area: 
-- NPC:  Airship_Door (instance 2)
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
	   player:startEvent(0x7d03,2);
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
local mammet_2_1=GetMobAction(16908296);
local mammet_2_2=GetMobAction(16908297);
local mammet_2_3=GetMobAction(16908298);
local mammet_2_4=GetMobAction(16908299);
local mammet_2_5=GetMobAction(16908300);
local omega2=GetMobAction(16908301);
local ultima2=GetMobAction(16908302);

	if(csid ==0x7d03 and option==101)then -- instance 2
	  if(mammet_2_1 > 0 or mammet_2_2 > 0 or mammet_2_3 > 0 or mammet_2_4 > 0 or mammet_2_5 > 0)then--on check si il y as un mammet en vie
	     player:startEvent(0x0000,2);		 
	  elseif(omega2 > 0)then--on check si il y as omega envie
	     player:startEvent(0x0001,2);
	  elseif(ultima2 > 0)then--on check si il y as omega envie
	     player:startEvent(0x0002,2);
	  end
	end
	
end;