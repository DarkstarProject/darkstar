-----------------------------------
-- Area: Apollyon SE
--  NPC: Ghost_Clot

-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Apollyon/TextIDs");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
    GetMobByID(16932993):updateEnmity(target);
    GetMobByID(16932994):updateEnmity(target);
    GetMobByID(16932995):updateEnmity(target);
    GetMobByID(16932996):updateEnmity(target);
    GetMobByID(16932997):updateEnmity(target);
    GetMobByID(16932998):updateEnmity(target);
    GetMobByID(16932999):updateEnmity(target);
    GetMobByID(16933000):updateEnmity(target);
end;

function onMobDeath(mob, player, isKiller)

end;