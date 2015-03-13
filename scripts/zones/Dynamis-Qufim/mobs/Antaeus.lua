-----------------------------------
-- Area: Dynamis Qufim
-- NPC:  Antaeus

-----------------------------------
package.loaded["scripts/zones/Dynamis-Qufim/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/dynamis");
require("scripts/globals/status");
require("scripts/zones/Dynamis-Qufim/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;
-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

   if(GetServerVariable("[DynaQufim]Boss_Trigger")==0)then	
		--spawn additional mob :     
	   for  Nightmare_Stirge = 16945407, 16945420, 1 do	
			 SpawnMob(Nightmare_Stirge);
			 GetMobByID(Nightmare_Stirge):setMobMod(MOBMOD_MAIN_2HOUR,1);
	   end
	   for  Nightmare_Diremite = 16945422, 16945430, 1 do	
			 SpawnMob(Nightmare_Diremite);
			 GetMobByID(Nightmare_Diremite):setMobMod(MOBMOD_MAIN_2HOUR,1);				 
	   end
	   for  Nightmare_Gaylas = 16945431, 16945442, 1 do	
			 SpawnMob(Nightmare_Gaylas);   
			 GetMobByID(Nightmare_Gaylas):setMobMod(MOBMOD_MAIN_2HOUR,1);
	   end
	   for  Nightmare_Kraken = 16945443, 16945456, 1 do	
			 SpawnMob(Nightmare_Kraken);   
			 GetMobByID(Nightmare_Kraken):setMobMod(MOBMOD_MAIN_2HOUR,1);
	   end
	   for  Nightmare_Snoll = 16945458, 16945469, 1 do	
			 SpawnMob(Nightmare_Snoll);   
			 GetMobByID(Nightmare_Snoll):setMobMod(MOBMOD_MAIN_2HOUR,1);
	   end
	   for  Nightmare_Tiger = 16945510, 16945521, 1 do	
			 SpawnMob(Nightmare_Tiger);   
			 GetMobByID(Nightmare_Tiger):setMobMod(MOBMOD_MAIN_2HOUR,1);
	   end
	   for  Nightmare_Weapon = 16945549, 16945558, 1 do	
			 SpawnMob(Nightmare_Weapon);   
			 GetMobByID(Nightmare_Weapon):setMobMod(MOBMOD_MAIN_2HOUR,1);
	   end
	   for  Nightmare_Raptor = 16945589, 16945598, 1 do	
			 SpawnMob(Nightmare_Raptor);   
			 GetMobByID(Nightmare_Raptor):setMobMod(MOBMOD_MAIN_2HOUR,1);
	   end			   
	SetServerVariable("[DynaQufim]Boss_Trigger",1);
	end		   
end;
               			
-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
  if(killer:hasKeyItem(DYNAMIS_QUFIM_SLIVER ) == false)then 
       killer:addKeyItem(DYNAMIS_QUFIM_SLIVER);
	   killer:messageSpecial(KEYITEM_OBTAINED,DYNAMIS_QUFIM_SLIVER);
  end
       killer:addTitle(DYNAMISQUFIM_INTERLOPER);
end;