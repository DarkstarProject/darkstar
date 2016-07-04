
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/zones/The_Ashu_Talif/TextIDs");
require("scripts/zones/The_Ashu_Talif/IDs"); 
function onMobInitialize(mob)
  
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)


end;

function onMobEngaged(mob, target)
   end;

function onMobFight(mob, target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)


end;


function onMobRoam(mob)

 
 

    local instance = mob:getInstance();
	printf("instance %s",instance)
	-- local inst2 instance:getEntity();
	-- local attack = instance:getEntity(17022980);
    local mobs = instance:getMobs();
	printf("mobs %s",mobs)
    local baseID = 17022980
  
   mob:setLocalVar("wait", 0);
    
       
    
    for i, v in pairs(mobs) do
       mob:addEnmity(v, 1, 1);
	   printf("v %s",v)
		
    end
    
    
end;