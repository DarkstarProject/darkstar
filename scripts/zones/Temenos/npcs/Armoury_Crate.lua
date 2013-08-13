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
 	local X = npc:getXPos();
	local Y = npc:getYPos();
	local Z = npc:getZPos();
	
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
 local coffer = CofferID-16928768;
 
    if(CofferType == cTIME)then 
	        player:addTimeToSpecialInstance(InstanceRegion,addtime);
	elseif(CofferType == cITEM)then
            player:BCNMSetLoot(lootID,InstanceRegion,CofferID);
            player:getBCNMloot();
    elseif(CofferType == cRESTORE)then 
			player:RestoreAndHealOnInstance(InstanceRegion);
	elseif(CofferType == cMIMIC)then 
	     if(coffer == 284)then
		    GetMobByID(16928844):setSpawn(X,Y,Z);
		    SpawnMob(16928844):setPos(X,Y,Z)
			GetMobByID(16928844):updateEnmity(player);		   
	     elseif(coffer == 321)then
		    GetMobByID(16928853):setSpawn(X,Y,Z);
		    SpawnMob(16928853):setPos(X,Y,Z);
			GetMobByID(16928853):updateEnmity(player);
	     elseif(coffer == 348)then
		    GetMobByID(16928862):setSpawn(X,Y,Z);
		    SpawnMob(16928862):setPos(X,Y,Z);
			GetMobByID(16928862):updateEnmity(player);
         elseif(coffer == 360)then
		    GetMobByID(16928871):setSpawn(X,Y,Z);
		    SpawnMob(16928871):setPos(X,Y,Z);
			GetMobByID(16928871):updateEnmity(player);
	     elseif(coffer == 393)then
		    GetMobByID(16928880):setSpawn(X,Y,Z);
		    SpawnMob(16928880):setPos(X,Y,Z);
			GetMobByID(16928880):updateEnmity(player);
	     elseif(coffer == 127)then
		    GetMobByID(16928889):setSpawn(X,Y,Z);
		    SpawnMob(16928889):setPos(X,Y,Z);
			GetMobByID(16928889):updateEnmity(player);
	     elseif(coffer == 123)then
		    GetMobByID(16928894):setSpawn(X,Y,Z);
		    SpawnMob(16928894):setPos(X,Y,Z);
			GetMobByID(16928894):updateEnmity(player);
	     end
	end  
	if(DespawnOtherCoffer==true)then
	    HideArmouryCrates(InstanceRegion,TEMENOS);
		   if(InstanceRegion==Temenos_Eastern_Tower)then --despawn mob of the current floor
                if(coffer == 173 or coffer == 215 or coffer == 284 or coffer == 40)then
				       --floor 1
				   if(GetMobAction(16928840) > 0)then DespawnMob(16928840);end
		           if(GetMobAction(16928841) > 0)then DespawnMob(16928841);end
		           if(GetMobAction(16928842) > 0)then DespawnMob(16928842);end
		           if(GetMobAction(16928843) > 0)then DespawnMob(16928843);end
				   GetNPCByID(16928768+457):setStatus(STATUS_NORMAL);
                elseif(coffer == 174 or coffer == 216 or coffer == 321 or coffer == 45)then
				   --floor 2
				   if(GetMobAction(16928849) > 0)then DespawnMob(16928849);end
		          if(GetMobAction(16928850) > 0)then DespawnMob(16928850);end
		         if(GetMobAction(16928851) > 0)then DespawnMob(16928851);end
		           if(GetMobAction(16928852) > 0)then DespawnMob(16928852);end
				   GetNPCByID(16928768+458):setStatus(STATUS_NORMAL);
			    elseif(coffer == 181 or coffer == 217 or coffer == 348 or coffer == 46)then
					   --floor 3
				   if(GetMobAction(16928858) > 0)then DespawnMob(16928858);end
		           if(GetMobAction(16928859) > 0)then DespawnMob(16928859);end
		           if(GetMobAction(16928860) > 0)then DespawnMob(16928860);end
		           if(GetMobAction(16928861) > 0)then DespawnMob(16928861);end
				  GetNPCByID(16928768+459):setStatus(STATUS_NORMAL);
                elseif(coffer == 182 or coffer == 236 or coffer == 360 or coffer == 47)then
					   --floor 4
					if(GetMobAction(16928867) > 0)then DespawnMob(16928867);end
		            if(GetMobAction(16928868) > 0)then DespawnMob(16928868);end
		            if(GetMobAction(16928869) > 0)then DespawnMob(16928869);end
		            if(GetMobAction(16928870) > 0)then DespawnMob(16928870);end
					GetNPCByID(16928768+460):setStatus(STATUS_NORMAL);
                elseif(coffer == 183 or coffer == 261 or coffer == 393 or coffer == 68)then
					   --floor 5
					if(GetMobAction(16928876) > 0)then DespawnMob(16928876);end
		            if(GetMobAction(16928877) > 0)then DespawnMob(16928877);end
		            if(GetMobAction(16928878) > 0)then DespawnMob(16928878);end
		            if(GetMobAction(16928879) > 0)then DespawnMob(16928879);end
					GetNPCByID(16928768+461):setStatus(STATUS_NORMAL);
                elseif(coffer == 277 or coffer == 190 or coffer ==  127 or coffer == 69)then
					   --floor 6
					if(GetMobAction(16928885) > 0)then DespawnMob(16928885);end
		            if(GetMobAction(16928886) > 0)then DespawnMob(16928886);end
		            if(GetMobAction(16928887) > 0)then DespawnMob(16928887);end
		            if(GetMobAction(16928888) > 0)then DespawnMob(16928888);end
					GetNPCByID(16928768+462):setStatus(STATUS_NORMAL);
                elseif(coffer == 70 or coffer == 123)then
					   --floor 7
					if(GetMobAction(16928892) > 0)then DespawnMob(16928892);end
		            if(GetMobAction(16928893) > 0)then DespawnMob(16928893);end
					GetNPCByID(16928768+463):setStatus(STATUS_NORMAL);
                end				
		   end		
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
