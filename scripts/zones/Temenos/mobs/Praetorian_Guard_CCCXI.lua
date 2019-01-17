-----------------------------------
-- Area: Temenos N T
-- NPC:  Praetorian_Guard

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
 if (IsMobDead(16928809)==true and IsMobDead(16928810)==true  and IsMobDead(16928811)==true and IsMobDead(16928812)==true ) then
       GetNPCByID(16928768+28):setPos(-311,80,419);
    GetNPCByID(16928768+28):setStatus(dsp.status.NORMAL);
    GetNPCByID(16928768+162):setPos(-311,80,417);
    GetNPCByID(16928768+162):setStatus(dsp.status.NORMAL);
    GetNPCByID(16928768+213):setPos(-311,80,421);
    GetNPCByID(16928768+213):setStatus(dsp.status.NORMAL);
    GetNPCByID(16928770+454):setStatus(dsp.status.NORMAL);
 end
end;
