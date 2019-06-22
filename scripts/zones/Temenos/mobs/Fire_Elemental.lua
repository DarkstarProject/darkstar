-----------------------------------
-- Area: Temenos E T
-- NPC: Fire_Elemental

-----------------------------------
require("scripts/globals/limbus");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
   local mobID = mob:getID();
   local mobX = mob:getXPos();
   local mobY = mob:getYPos();
   local mobZ = mob:getZPos();
     switch (mobID): caseof {
        [16928840] = function (x)
           GetNPCByID(16928768+173):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+173):setStatus(dsp.status.NORMAL);
        end    ,
        [16928841] = function (x)
           GetNPCByID(16928768+215):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+215):setStatus(dsp.status.NORMAL);
        end    ,
        [16928842] = function (x)
           GetNPCByID(16928768+284):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+284):setStatus(dsp.status.NORMAL);
        end    ,
        [16928843] = function (x)
           GetNPCByID(16928768+40):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+40):setStatus(dsp.status.NORMAL);
        end    ,
        [16929033] = function (x)
           if (IsMobDead(16929034)==false) then -- ice
             DespawnMob(16929034);
             SpawnMob(16929040);
           end
        end    ,
     }
end;