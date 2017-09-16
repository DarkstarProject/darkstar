-----------------------------------
-- Area: Dangruf Wadi (191)
--  Mob: Chocoboleech
-- !pos: -430.330 4.400 115.100
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)    
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local npc = GetNPCByID(17559876);
    
    npc:updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
    
    local randpos = math.random(1,3);
    
    switch (randpos): caseof
    {
        [1] = function (x) npc:setPos(-430.330,4.400,115.100); end, 
        [2] = function (x) npc:setPos(-492.926,4.337,-7.936); end, 
        [3] = function (x) npc:setPos(-75.392,2.531,293.357); end, 
    }    
end;