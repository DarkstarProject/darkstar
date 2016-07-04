-----------------------------------
-- Area: Apollyon SE
-- NPC:  Adamantshell

-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
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
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

  local mobID = mob:getID();
-- print(mobID);
      local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();

 if (mobID ==16933008) then --
       GetNPCByID(16932864+232):setPos(108,-1,-518);
    GetNPCByID(16932864+232):setStatus(STATUS_NORMAL);
 elseif (mobID ==16933013) then --
       GetNPCByID(16932864+233):setPos(109,-1,-521);
    GetNPCByID(16932864+233):setStatus(STATUS_NORMAL);
 elseif (mobID ==16933007) then --
      GetNPCByID(16932864+234):setPos(112,-1,-523);
    GetNPCByID(16932864+234):setStatus(STATUS_NORMAL);
 end

end;