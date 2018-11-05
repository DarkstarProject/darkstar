-----------------------------------
-- Area: Dynamis tavnazia
--  NPC: Vanguard_Eye

-----------------------------------
require("scripts/globals/dynamis");
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, mob:getShortID());
end;

function onMobEngaged(mob,target)
    if ( mob:getID() > 16949486 ) then
        -- second floor eyes spawn hydra mobs
        dynamis.spawnGroup(mob, TavnaziaEyesList, 1);
    else
        -- third floor eyes spawn kindred mobs and taurus
        dynamis.spawnGroup(mob, TavnaziaEyesList, 2);

        local X = mob:getXPos();
        local Y = mob:getYPos();
        local Z = mob:getZPos();

        for nt = 1, #TavnaziaTaurusList, 2 do
            if (mob:getID() == TavnaziaTaurusList[nt] and TavnaziaTaurusList[nt+1][1] ~= 0) then
                for nf = 1 ,TavnaziaTaurusList[nt+1][1] , 1 do
                    for TauruslistID = 16949307 , 16949316 , 1 do
                        if ( GetMobAction(TauruslistID) == 0 ) then
                            local dX = math.pow(-1,math.random(0,1))
                            local dZ = math.pow(-1,math.random(0,1))
                            SpawnMob(TauruslistID):setMobMod(dsp.mobMod.SUPERLINK, mob:getShortID());
                            GetMobByID(TauruslistID):setPos(X+dX,Y,Z+dZ);
                            GetMobByID(TauruslistID):setSpawn(X+dX,Y,Z+dZ);
                            break;
                        end
                    end
                end
            end
        end

    end
end;

function onMobDeath(mob, player, isKiller)
end;
