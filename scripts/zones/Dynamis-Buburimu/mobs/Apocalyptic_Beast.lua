-----------------------------------
-- Area: Dynamis Buburimu
-- NPC:  Apocalyptic_Beast

-----------------------------------
package.loaded["scripts/zones/Dynamis-Buburimu/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Buburimu/TextIDs");
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

   if (GetServerVariable("[DynaBuburimu]Boss_Trigger")==0) then	
   --spwan additional mob :     
           for additionalmob = 16941489, 16941665, 1 do
		       if (additionalmob ~= 16941666 or additionalmob ~= 16941576 or additionalmob ~= 16941552 or additionalmob ~= 16941520) then		
		         SpawnMob(additionalmob);
		      end  		   
		   end
     SetServerVariable("[DynaBuburimu]Boss_Trigger",1);
   end

		   
end;
               			
-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
		
  if (killer:hasKeyItem(DYNAMIS_BUBURIMU_SLIVER ) == false) then 
       killer:addKeyItem(DYNAMIS_BUBURIMU_SLIVER);
	   killer:messageSpecial(KEYITEM_OBTAINED,DYNAMIS_BUBURIMU_SLIVER);
  end
       killer:addTitle(DYNAMISBUBURIMU_INTERLOPER);
end;