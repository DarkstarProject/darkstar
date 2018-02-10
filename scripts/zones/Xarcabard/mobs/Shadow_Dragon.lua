-----------------------------------
-- Area: Xarcabard
--  MOB: Shadow_Dragon
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local B_ToD = GetServerVariable("[POP]Biast");
    local X = mob:getXPos();
    local Y = mob:getYPos();
    local Z = mob:getZPos();
    -- Check if Biast window is open, and there is not an Biast popped already(ACTION_NONE = 0)
    if (B_ToD <= os.time() and GetMobAction(mob:getID()+1) == 0) then
        if (math.random(1,20) == 5) then
            -- printf("Biast will pop");
            SpawnMob(mob:getID()+1);
            GetMobByID(mob:getID()+1):setPos(X,Y,Z);
            GetMobByID(mob:getID()+1):setSpawn(X,Y,Z);
            DisallowRespawn(mob:getID(), true);
        end
    end
end;
