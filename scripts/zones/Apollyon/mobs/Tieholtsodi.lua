-----------------------------------
-- Area: Apollyon SE
-- NPC:  Tieholtsodi

-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Apollyon/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    GetMobByID(16933007):updateEnmity(target);
    GetMobByID(16933008):updateEnmity(target);
    GetMobByID(16933009):updateEnmity(target);
    GetMobByID(16933010):updateEnmity(target);
    GetMobByID(16933011):updateEnmity(target);
    GetMobByID(16933012):updateEnmity(target);
    GetMobByID(16933013):updateEnmity(target);
    GetMobByID(16933014):updateEnmity(target);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
   
end;