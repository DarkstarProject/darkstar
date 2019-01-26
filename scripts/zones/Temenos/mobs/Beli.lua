-----------------------------------
-- Area: Temenos N T
-- NPC:  Beli

-----------------------------------
require("scripts/globals/limbus");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    GetMobByID(16928781):updateEnmity(target);
        GetMobByID(16928782):updateEnmity(target);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
 if (IsMobDead(16928781)==true and IsMobDead(16928782)==true  and IsMobDead(16928783)==true ) then
       GetNPCByID(16928768+19):setPos(200,-82,495);
    GetNPCByID(16928768+19):setStatus(dsp.status.NORMAL);
    GetNPCByID(16928768+153):setPos(206,-82,495);
    GetNPCByID(16928768+153):setStatus(dsp.status.NORMAL);
    GetNPCByID(16928768+210):setPos(196,-82,495);
    GetNPCByID(16928768+210):setStatus(dsp.status.NORMAL);
 end
end;