-----------------------------------
-- Area: Apollyon Centrale
-- NPC:  Proto-Omega

-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Apollyon/TextIDs");
require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
--print("Proto-omega_engaged");
mob:setMod(MOD_SLASHRES,300);
mob:setMod(MOD_PIERCERES,300);
mob:setMod(MOD_IMPACTRES,300);
mob:setMod(MOD_HTHRES,300);
	  for n =1,table.getn (resistMod),1 do
	     mob:setMod(resistMod[n],-50); 
	  end
	  for n =1,table.getn (defenseMod),1 do
	     mob:setMod(defenseMod[n],-50);
	  end 
end;
-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
local mobID = mob:getID();
local lifepourcent= ((mob:getHP()/mob:getMaxHP())*100); 
   if (lifepourcent > 70 or lifepourcent <30) then
	   mob:AnimationSub(1);	     
   elseif (lifepourcent > 30 and lifepourcent < 70) then
       mob:AnimationSub(2);	
   end
   
   if (lifepourcent > 30 and lifepourcent < 70 and mob:getLocalVar("form") == 8) then   -- bipede
       mob:setMod(MOD_SLASHRES,1400);
       mob:setMod(MOD_PIERCERES,1400);
       mob:setMod(MOD_IMPACTRES,1400);
       mob:setMod(MOD_HTHRES,1400);
	  for n =1,table.getn (resistMod),1 do
	     mob:setMod(resistMod[n],100); 
	  end
	  for n =1,table.getn (defenseMod),1 do
	     mob:setMod(defenseMod[n],100);
	  end  
	   SpawnMob(16933125):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());-- spawn gunpod
	   mob:setLocalVar("form", 9)	   
	  -- print("bipede");   
   elseif (lifepourcent < 30 and mob:getLocalVar("form") == 9  ) then	                 -- quadripede 
       mob:setMod(MOD_SLASHRES,1450);
       mob:setMod(MOD_PIERCERES,1450);
       mob:setMod(MOD_IMPACTRES,1450);
       mob:setMod(MOD_HTHRES,1450);
 	   for n =1,table.getn (resistMod),1 do
	     mob:setMod(resistMod[n],-50); 
	   end
	   for n =1,table.getn (defenseMod),1 do
	     mob:setMod(defenseMod[n],-50);
	   end   
	   mob:addStatusEffect(EFFECT_REGAIN,7,3,0); -- The final form has Regain,
	   SpawnMob(16933125):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());-- spawn gunpod  
	   mob:setLocalVar("form", 8);
   end
	

end;
-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
  killer:addTitle(APOLLYON_RAVAGER);
    local mobX = mob:getXPos();
	local mobY = mob:getYPos();
	local mobZ = mob:getZPos();
    GetNPCByID(16932864+39):setPos(mobX,mobY,mobZ);
	GetNPCByID(16932864+39):setStatus(STATUS_NORMAL);
end;

