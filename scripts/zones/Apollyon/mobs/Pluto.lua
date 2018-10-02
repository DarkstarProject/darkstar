-----------------------------------
-- Area: Apollyon NW
--  NPC: Pluto

-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
      local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();
    GetNPCByID(16932864+107):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+107):setStatus(dsp.status.NORMAL);
end;