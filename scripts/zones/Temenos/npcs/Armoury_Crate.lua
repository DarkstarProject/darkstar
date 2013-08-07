-----------------------------------
-- Area: Temenos
-- NPC:  Armoury Crate
-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Temenos/TextIDs");
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
 
  for coffer = 1,table.getn (ARMOURY_CRATES_LIST_TEMENOS),2 do
      if(ARMOURY_CRATES_LIST_TEMENOS[coffer]== CofferID-16928768)then	 	  
	     CofferType=ARMOURY_CRATES_LIST_TEMENOS[coffer+1][1];
		 InstanceRegion=ARMOURY_CRATES_LIST_TEMENOS[coffer+1][2];
		 addtime=ARMOURY_CRATES_LIST_TEMENOS[coffer+1][3];
		 DespawnOtherCoffer=ARMOURY_CRATES_LIST_TEMENOS[coffer+1][4];
		 MimicID=ARMOURY_CRATES_LIST_TEMENOS[coffer+1][5];
		 lootID=ARMOURY_CRATES_LIST_TEMENOS[coffer+1][6];			 
	  end	  
  end
  
 printf("CofferID : %u",CofferID-16928768);
 printf("Coffertype %u",CofferType);
 printf("InstanceRegion: %u",InstanceRegion);
 printf("addtime: %u",addtime);
 printf("MimicID: %u",MimicID);
 printf("lootID: %u",lootID);
 
 
    if(CofferType == cTIME)then 
	        player:addTimeToSpecialInstance(InstanceRegion,addtime);
	elseif(CofferType == cITEM)then
            player:BCNMSetLoot(lootID,InstanceRegion,CofferID);
            player:getBCNMloot();
    elseif(CofferType == cRESTORE)then 
			player:RestoreAndHealOnInstance(InstanceRegion);
	elseif(CofferType == cMIMIC)then 
	end  
	if(DespawnOtherCoffer==true)then
	    HideArmouryCrates(InstanceRegion,TEMENOS);
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
