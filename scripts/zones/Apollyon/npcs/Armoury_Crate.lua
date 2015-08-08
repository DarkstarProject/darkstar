-----------------------------------
-- Area: Apollyon
-- NPC:  Armoury Crate
-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Apollyon/TextIDs");
require("scripts/globals/limbus");
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
 local  CofferID = npc:getID();
 local  CofferType=0;
 local  lootID=0;
 local  InstanceRegion=0;  
 local  addtime=0;
 local  DespawnOtherCoffer=false;
 local  MimicID=0;
 
  for coffer = 1,table.getn (ARMOURY_CRATES_LIST_APPOLLYON),2 do
      if (ARMOURY_CRATES_LIST_APPOLLYON[coffer]== CofferID-16932864) then	  
	     CofferType=ARMOURY_CRATES_LIST_APPOLLYON[coffer+1][1];
		 InstanceRegion=ARMOURY_CRATES_LIST_APPOLLYON[coffer+1][2];
		 addtime=ARMOURY_CRATES_LIST_APPOLLYON[coffer+1][3];
		 DespawnOtherCoffer=ARMOURY_CRATES_LIST_APPOLLYON[coffer+1][4];
		 MimicID=ARMOURY_CRATES_LIST_APPOLLYON[coffer+1][5];
		 lootID=ARMOURY_CRATES_LIST_APPOLLYON[coffer+1][6];		 				 
	  end	  
  end
  
-- printf("CofferID : %u",CofferID-16932864);
-- printf("Coffertype %u",CofferType);
-- printf("InstanceRegion: %u",InstanceRegion);
-- printf("addtime: %u",addtime);
-- printf("MimicID: %u",MimicID);
-- printf("lootID: %u",lootID);
 
 
    if (CofferType == cTIME) then 
	        player:addTimeToSpecialBattlefield(InstanceRegion,addtime);
	elseif (CofferType == cITEM) then
            player:BCNMSetLoot(lootID,InstanceRegion,CofferID);
            player:getBCNMloot();
    elseif (CofferType == cRESTORE) then 
			player:RestoreAndHealOnBattlefield(InstanceRegion);
	elseif (CofferType == cMIMIC) then 
	     if (CofferID==16932864+210) then 
		    	GetNPCByID(16932864+195):setPos(npc:getXPos(),npc:getYPos(),npc:getZPos());
                GetNPCByID(16932864+195):setStatus(STATUS_NORMAL);
	     elseif (CofferID==16932864+211) then
		 		 		GetMobByID(16932896):setPos(npc:getXPos(),npc:getYPos(),npc:getZPos());
						GetMobByID(16932896):setSpawn(npc:getXPos(),npc:getYPos(),npc:getZPos());
						GetMobByID(16932896):updateClaim(player);
	     elseif (CofferID==16932864+212) then
		    	GetNPCByID(16932864+196):setPos(npc:getXPos(),npc:getYPos(),npc:getZPos());
	            GetNPCByID(16932864+196):setStatus(STATUS_NORMAL);
	     elseif (CofferID==16932864+213) then
		 				GetMobByID(16932897):setPos(npc:getXPos(),npc:getYPos(),npc:getZPos());
						GetMobByID(16932897):setSpawn(npc:getXPos(),npc:getYPos(),npc:getZPos());
						GetMobByID(16932897):updateClaim(player);
	     elseif (CofferID==16932864+214) then
		    	GetNPCByID(16932864+197):setPos(npc:getXPos(),npc:getYPos(),npc:getZPos());
	            GetNPCByID(16932864+197):setStatus(STATUS_NORMAL);
	     elseif (CofferID==16932864+215) then
			 			GetMobByID(16932898):setPos(npc:getXPos(),npc:getYPos(),npc:getZPos());
						GetMobByID(16932898):setSpawn(npc:getXPos(),npc:getYPos(),npc:getZPos());	
						GetMobByID(16932898):updateClaim(player);
	     elseif (CofferID==16932864+216) then	
		 		 		GetMobByID(16932899):setPos(npc:getXPos(),npc:getYPos(),npc:getZPos());
						GetMobByID(16932899):setSpawn(npc:getXPos(),npc:getYPos(),npc:getZPos());
						GetMobByID(16932899):updateClaim(player);
	     end		
	end  
	if (DespawnOtherCoffer==true) then
	    HideArmouryCrates(InstanceRegion,APPOLLYON_SE_NE);
	end
	
   npc:setStatus(STATUS_DISAPPEAR);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
end;
