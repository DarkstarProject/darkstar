-----------------------------------
-- Area: Korroloka Tunnel (173)
--  Mob: Morion Worm
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
    local npc = GetNPCByID(17486213);
    
    npc:updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
    
    local randpos = math.random(1,6);
    
    switch (randpos): caseof
    {
        [1] = function (x) npc:setPos(254.652,-6.039,20.878); end, 
        [2] = function (x) npc:setPos(273.350,-7.567,95.349); end, 
        [3] = function (x) npc:setPos(-43.004,-5.579,96.528); end, 
        [4] = function (x) npc:setPos(-96.798,-5.679,94.728); end,  
        [5] = function (x) npc:setPos(-373.924,-10.548,-27.850); end, 
        [6] = function (x) npc:setPos(-376.787,-8.574,-54.842); end, 
    }    
end;