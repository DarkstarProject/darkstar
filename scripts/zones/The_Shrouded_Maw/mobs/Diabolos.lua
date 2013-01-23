-----------------------------------	
-- Area: 
-- MOB: Diabolos
-----------------------------------	
function OnMobEngaged(mob)
print("mobengage");
end;	
	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
function onMobDeath(mob,killer)		
end;
	
	
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;
	
-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
local mobid=mob:getID();
local lifepourcent= ((mob:getHP()/mob:getMaxHP())*100); 
    if (mobid == 16818177 or mobid == 16818204) then
          if(lifepourcent < 10)then	  
           GetNPCByID(16818241):setAnimation(8);
          elseif (lifepourcent < 20)then	
           GetNPCByID(16818242):setAnimation(8);
	      elseif (lifepourcent < 30)then		 
           GetNPCByID(16818243):setAnimation(8);
	      elseif (lifepourcent < 40)then		 
           GetNPCByID(16818244):setAnimation(8);
	      elseif (lifepourcent < 50)then		 
           GetNPCByID(16818245):setAnimation(9);
	      elseif (lifepourcent < 65)then		 
           GetNPCByID(16818246):setAnimation(8);
	      elseif (lifepourcent < 75)then	 
           GetNPCByID(16818247):setAnimation(8);
	      elseif (lifepourcent < 90)then	 
           GetNPCByID(16818248):setAnimation(8);
	      end	 
   elseif (mobid == 16818184 or mobid == 16818211) then
          if(lifepourcent < 10)then	  
           GetNPCByID(16818249):setAnimation(8);
          elseif (lifepourcent < 20)then	
           GetNPCByID(16818250):setAnimation(8);
          elseif (lifepourcent < 30)then	
           GetNPCByID(16818251):setAnimation(8);
          elseif (lifepourcent < 40)then	
           GetNPCByID(16818252):setAnimation(8);
          elseif (lifepourcent < 50)then	
           GetNPCByID(16818253):setAnimation(8);
          elseif (lifepourcent < 65)then	
           GetNPCByID(16818254):setAnimation(8);
          elseif (lifepourcent < 75)then	
           GetNPCByID(16818255):setAnimation(8);
          elseif (lifepourcent < 90)then	
           GetNPCByID(16818256):setAnimation(8);
          end
    elseif (mobid == 16818191 or mobid == 16818218) then
          if(lifepourcent < 10)then	 
           GetNPCByID(16818257):setAnimation(8);
          elseif (lifepourcent < 20)then	
           GetNPCByID(16818258):setAnimation(8);
         elseif (lifepourcent < 30)then	
          GetNPCByID(16818259):setAnimation(8);
         elseif (lifepourcent < 40)then	
          GetNPCByID(16818260):setAnimation(8);
         elseif (lifepourcent < 50)then	
          GetNPCByID(16818261):setAnimation(8);
         elseif (lifepourcent < 65)then	
          GetNPCByID(16818262):setAnimation(8);
         elseif (lifepourcent < 75)then	
          GetNPCByID(16818263):setAnimation(8);
         elseif (lifepourcent < 90)then	
          GetNPCByID(16818264):setAnimation(8);
         end
   end


end;
