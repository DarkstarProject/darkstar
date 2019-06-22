-----------------------------------
-- Area: Temenos E T
-- NPC: Ice_Elemental

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
         -- 100 a 106 inclut (Temenos -Northern Tower )
        [16928849] = function (x)
           GetNPCByID(16928768+174):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+174):setStatus(dsp.status.NORMAL);
        end    ,
        [16928850] = function (x)
           GetNPCByID(16928768+216):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+216):setStatus(dsp.status.NORMAL);
        end    ,
        [16928851] = function (x)
           GetNPCByID(16928768+321):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+321):setStatus(dsp.status.NORMAL);
        end    ,
        [16928852] = function (x)
           GetNPCByID(16928768+45):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+45):setStatus(dsp.status.NORMAL);
        end    ,
        [16929034] = function (x)
           if (IsMobDead(16929035)==false) then -- wind
             DespawnMob(16929035);
             SpawnMob(16929041);
           end
        end    ,

        
     }
end;