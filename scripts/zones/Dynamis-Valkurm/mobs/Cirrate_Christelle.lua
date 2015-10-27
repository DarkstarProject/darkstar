-----------------------------------
-- Area: Dynamis Valkurm
-- NPC:  Cirrate_Christelle
-----------------------------------
package.loaded["scripts/zones/Dynamis-Valkurm/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Valkurm/TextIDs");
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

if (GetServerVariable("[DynaValkurm]Boss_Trigger")==0) then	
   --spwan additional mob :
           -- print("Serjeant_Tombstone:");
           for Serjeant_Tombstone = 16937494, 16937499, 1 do
		   -- printf("addmob %u \n",Serjeant_Tombstone);
		   SpawnMob(Serjeant_Tombstone);
		   end
           -- print("Adamantking_Effigy:");
           for Adamantking_Effigy = 16937519, 16937524, 1 do
		   -- printf("addmob %u \n",Adamantking_Effigy);
		   SpawnMob(Adamantking_Effigy);
		   end
           -- print("Manifest_Icon:");
           for Manifest_Icon = 16937544, 16937549, 1 do
		   -- printf("addmob %u \n",Manifest_Icon);
		   SpawnMob(Manifest_Icon);
		   end
           -- print("Goblin_Replica:");
           for Goblin_Replica = 16937569, 16937574, 1 do
		   -- printf("addmob %u \n",Goblin_Replica);
		   SpawnMob(Goblin_Replica);
		   end
		   ----
		   -- print("Nightmare_Hippogryph:");
           for Nightmare_Hippogryph = 16937377, 16937394, 1 do
		   -- printf("addmob %u \n",Nightmare_Hippogryph);
		   SpawnMob(Nightmare_Hippogryph);
		   end
		   -- print("Nightmare_Sheep:");
           for Nightmare_Sheep = 16937169, 16937189, 1 do
		   -- printf("addmob %u \n",Nightmare_Sheep);
		   SpawnMob(Nightmare_Sheep);
		   end
		   for Nightmare_Sheep2 = 16937433,16937436, 1 do
		   -- printf("addmob %u \n",Nightmare_Sheep2);
		   SpawnMob(Nightmare_Sheep2);
		   end		   
		   -- print("Nightmare_Sabotender:");
           for Nightmare_Sabotender = 16937136, 16937139, 1 do
		   -- printf("addmob %u \n",Nightmare_Sabotender);
		   SpawnMob(Nightmare_Sabotender);
		   end
		   -- SpawnMob(16937115);
           for Nightmare_Sabotender2 = 16937312, 16937333, 1 do
		    -- printf("addmob %u \n",Nightmare_Sabotender2);
		   SpawnMob(Nightmare_Sabotender2);
		   end
		   --  print("Nightmare_Manticore:");
	       for Nightmare_Manticore = 16936987, 16937011, 1 do
		   -- printf("addmob %u \n",Nightmare_Manticore);
		   SpawnMob(Nightmare_Manticore);
		   end	 
		   -- print("Nightmare_Funguar:");
	       for Nightmare_Funguar = 16937416, 16937431, 1 do
		   -- printf("addmob %u \n",Nightmare_Funguar);
		   SpawnMob(Nightmare_Funguar);
		   end	
		   -- print("Nightmare_Fly:");
	       for Nightmare_Fly = 16937455, 16937475, 1 do
		   -- printf("addmob %u \n",Nightmare_Fly);
		   SpawnMob(Nightmare_Fly);
		   end	
		   -- print("Nightmare_Treant:");
	       for Nightmare_Treant = 16937395, 16937415, 1 do
		   -- printf("addmob %u \n",Nightmare_Treant);
		   SpawnMob(Nightmare_Treant);
		   end	
		   -- print("Nightmare_Flytrap:");
	       for Nightmare_Flytrap = 16937334, 16937354, 1 do
		   -- printf("addmob %u \n",Nightmare_Flytrap);
		   SpawnMob(Nightmare_Flytrap);
		   end	
		   --	print("Nightmare_Goobbue:");
	       for Nightmare_Goobbue = 16937291, 16937310, 1 do
		   -- printf("addmob %u \n",Nightmare_Goobbue);
		   SpawnMob(Nightmare_Goobbue);
		   end	
     SetServerVariable("[DynaValkurm]Boss_Trigger",1);
   end

		   
end;
               			
-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
  if (killer:hasKeyItem(DYNAMIS_VALKURM_SLIVER ) == false) then 
       killer:addKeyItem(DYNAMIS_VALKURM_SLIVER);
	   killer:messageSpecial(KEYITEM_OBTAINED,DYNAMIS_VALKURM_SLIVER);
  end
       killer:addTitle(DYNAMISVALKURM_INTERLOPER);
end;