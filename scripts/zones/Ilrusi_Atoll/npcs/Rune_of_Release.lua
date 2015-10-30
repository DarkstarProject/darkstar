-----------------------------------
-- Area: 
-- NPC:  rune of release
-- @zone illrusi atoll
-- @pos
-----------------------------------
package.loaded["scripts/zones/Ilrusi_Atoll/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-------------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Ilrusi_Atoll/TextIDs");
require("scripts/globals/besieged");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
 
  local npcID = npc:getID();
 -- print(npcID);
  if (npcID==17002655) then
    player:startEvent(0x0064,4);
	

  
  end
  
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option)
 if (csid == 0x0064 and option==1) then

 local point =1000;
 	  ----------------RESPAWN COFFER NPC---------------------------------------
  local npcID;
  for npcID=17002505,17002516,1 do
   GetNPCByID(npcID):setStatus(0);
   GetNPCByID(npcID):setAnimation(90);   
  end
  GetNPCByID(17002654):setStatus(2); --despawn Ancient_Lockbox
  ------------------------------------------------------
	   --------------RANDOMIZE COFFER------------------------
  local correctcoffer = math.random(17002505,17002516);
  SetServerVariable("correctcoffer",correctcoffer);
  printf("corect_golden_salvage_coffer: %u",correctcoffer);
  ---------------------------------------------------
     if (player:hasCompletedMission(ASSAULT,GOLDEN_SALVAGE)) then 
          if (player:hasKeyItem(ASSAULT_ARMBAND)) then 
	      player:delKeyItem(ASSAULT_ARMBAND);
          point =1100;
          end	  
        player:addAssaultPoint(ILRUSI_ASSAULT_POINT,point);
		player:delMission(ASSAULT,GOLDEN_SALVAGE);
		player:delKeyItem(ILRUSI_ASSAULT_ORDERS);
	print(point);
     end
  
 
 player:setPos(28,-7,620,138,54);
 end
end;