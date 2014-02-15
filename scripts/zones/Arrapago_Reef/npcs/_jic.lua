-----------------------------------
-- Area: arrapago reef
-- NPC:  Runic Seal
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Arrapago_Reef/TextIDs");
require("scripts/globals/keyitems");

-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
local assault=player:getCurrentMission(ASSAULT);
local AssaultArmband;

 if (player:hasKeyItem(ASSAULT_ARMBAND))then 
 AssaultArmband = 1;
 else
 AssaultArmband = 0;
 end
  if (assault > 40 and assault < 51 and player:hasKeyItem(ILRUSI_ASSAULT_ORDERS))then  
     player:startEvent(0x00DB,assault,16,2,70,4,AssaultArmband,1,1,3);
  end
  return 1;	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
printf("onUpdate CSID: %u",csid);
printf("onUpdate RESULT: %u",option);

   if(csid == 0x00DB and option==3 )then
	printf("onFinish RESULT: %u",option);
	  player:setPos(385,-12,17,180,55);
	end
	
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
   
 
	
	
end;