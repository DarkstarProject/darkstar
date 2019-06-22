-----------------------------------
-- Area: Temenos E T
-- NPC: Earth_Elemental

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
        [16928867] = function (x)
           GetNPCByID(16928768+182):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+182):setStatus(dsp.status.NORMAL);
        end    ,
        [16928868] = function (x)
           GetNPCByID(16928768+236):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+236):setStatus(dsp.status.NORMAL);
        end    ,
        [16928869] = function (x)
           GetNPCByID(16928768+360):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+360):setStatus(dsp.status.NORMAL);
        end    ,
        [16928870] = function (x)
           GetNPCByID(16928768+47):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+47):setStatus(dsp.status.NORMAL);
        end    ,
        [16929036] = function (x)
           if (IsMobDead(16929037)==false) then
             DespawnMob(16929037);
             SpawnMob(16929043);
           end
        end    ,
     }
end;