-----------------------------------
-- Area: Apollyon NW
--  NPC: Millenary Mossback

-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
      local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();
    GetNPCByID(16932864+109):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+109):setStatus(dsp.status.NORMAL);
end;