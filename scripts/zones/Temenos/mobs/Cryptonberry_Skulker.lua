-----------------------------------
-- Area: Temenos N T
-- NPC: Cryptonberry_Skulker

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
 if (IsMobDead(16928816)==true and IsMobDead(16928817)==true ) then
       GetNPCByID(16928768+38):setPos(-412,-78,426);
    GetNPCByID(16928768+38):setStatus(dsp.status.NORMAL);
    GetNPCByID(16928768+172):setPos(-415,-78,427);
    GetNPCByID(16928768+172):setStatus(dsp.status.NORMAL);
    GetNPCByID(16928768+214):setPos(-412,-78,422);
    GetNPCByID(16928768+214):setStatus(dsp.status.NORMAL);
    GetNPCByID(16928770+455):setStatus(dsp.status.NORMAL);
 end
end;
