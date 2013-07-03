-----------------------------------
-- Area: 
-- NPC:  Airship_Door
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
  local instance=0;
 switch (npc:getID()) : caseof {
	   		                    [16908327] = function (x) 
								instance=1;
		                         end,
	   	   	                    [16908328] = function (x)
                                instance=2;								
		                         end,
	   	                      	[16908329] = function (x) 
								instance=3;
		                         end,
	                            }
  
  
  
  
	   player:startEvent(0x7d03,instance);
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
local mammet_1_1=GetMobAction(16908289);
local mammet_1_2=GetMobAction(16908290);
local mammet_1_3=GetMobAction(16908291);
local mammet_1_4=GetMobAction(16908292);
local mammet_1_5=GetMobAction(16908293);
local omega1=GetMobAction(16908294);
local ultima1=GetMobAction(16908295);
local mammet_2_1=GetMobAction(16908296);
local mammet_2_2=GetMobAction(16908297);
local mammet_2_3=GetMobAction(16908298);
local mammet_2_4=GetMobAction(16908299);
local mammet_2_5=GetMobAction(16908300);
local omega2=GetMobAction(16908301);
local ultima2=GetMobAction(16908302);
local mammet_3_1=GetMobAction(16908303);
local mammet_3_2=GetMobAction(16908304);
local mammet_3_3=GetMobAction(16908305);
local mammet_3_4=GetMobAction(16908306);
local mammet_3_5=GetMobAction(16908307);
local omega3=GetMobAction(16908308);
local ultima3=GetMobAction(16908309);

    if(csid ==0x7d03 and option==100)then -- instance 1
	  if(mammet_1_1 > 0 or mammet_1_2 > 0 or mammet_1_3 > 0 or mammet_1_4 > 0 or mammet_1_5 > 0)then--on check si il y as un mammet en vie
	     player:startEvent(0x0000,1);		 
	  elseif(omega1 > 0)then--on check si il y as omega envie
	     player:startEvent(0x0001,1);
	  elseif(ultima1 > 0)then--on check si il y as omega envie
	     player:startEvent(0x0002,1);
	  end
	elseif(csid ==0x7d03 and option==101)then -- instance 2
	  if(mammet_2_1 > 0 or mammet_2_2 > 0 or mammet_2_3 > 0 or mammet_2_4 > 0 or mammet_2_5 > 0)then--on check si il y as un mammet en vie
	     player:startEvent(0x0000,2);		 
	  elseif(omega2 > 0)then--on check si il y as omega envie
	     player:startEvent(0x0001,2);
	  elseif(ultima2 > 0)then--on check si il y as omega envie
	     player:startEvent(0x0002,2);
	  end
	elseif(csid ==0x7d03 and option==102)then -- instance 3
	  if(mammet_3_1 > 0 or mammet_3_2 > 0 or mammet_3_3 > 0 or mammet_3_4 > 0 or mammet_3_5 > 0)then--on check si il y as un mammet en vie
	     player:startEvent(0x0000,3);		 
	  elseif(omega3 > 0)then--on check si il y as omega envie
	     player:startEvent(0x0001,3);
	  elseif(ultima3 > 0)then--on check si il y as omega envie
	     player:startEvent(0x0002,3);
	  end
	end
	
end;