-----------------------------------
-- Area: Temenos N T
-- NPC:  Telchines_White_Mage

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
 if (IsMobDead(16928788)==true and IsMobDead(16928789)==true  and IsMobDead(16928792)==true   and IsMobDead(16928793)==true ) then
       GetNPCByID(16928768+26):setPos(19,80,430);
    GetNPCByID(16928768+26):setStatus(dsp.status.NORMAL);
    GetNPCByID(16928768+160):setPos(16,80,430);
    GetNPCByID(16928768+160):setStatus(dsp.status.NORMAL);
    GetNPCByID(16928768+211):setPos(22,80,430);
    GetNPCByID(16928768+211):setStatus(dsp.status.NORMAL);
 end
end;