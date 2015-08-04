-----------------------------------
-- Area: 
-- NPC:  Treasure Coffer
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


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
 player:messageSpecial(CHEST);
  local npcID = npc:getID();
  local correctcofferID = GetServerVariable("correctcoffer");
 print(npcID);
 print(correctcofferID);
  if (npcID == correctcofferID) then --correct coffer ??
   player:messageSpecial( GOLDEN);
   
   if (player:getCurrentMission(ASSAULT)==GOLDEN_SALVAGE) then
   player:completeMission(ASSAULT,GOLDEN_SALVAGE);
   end
   GetNPCByID(17002654):setStatus(0);--spawn Ancient_Lockbox
     local ID;
     for ID=17002505,17002516,1 do
     if (GetMobAction(ID) > 0) then DespawnMob(npcID);printf("mobdespawn: %u",ID);  end--despawn mimic
     end
	GetNPCByID(npcID):setAnimation(89);--coffer open anim
   else
   SpawnMob(npcID);
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
--printf("RESULT: %u",option);
end;