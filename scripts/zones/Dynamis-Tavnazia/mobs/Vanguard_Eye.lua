-----------------------------------
-- Area: Dynamis tavnazia
-- NPC:  Vanguard_Eye

-----------------------------------
package.loaded["scripts/zones/Dynamis-Tavnazia/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Tavnazia/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    local list=2;
    -- printf("mobID: %u",mobID);

    if ( mob:getID() > 16949486 ) then 
        list=1;
    end
    dynamis.spawnGroup(mob, TavnaziaEyesList, list);
            
        local TaurusNBR = 0;    
        local NBRtaurusadd = 0;    
        
        if (list == 2) then
            for nt = 1, table.getn(TavnaziaTautusList), 2 do              
                if (mob:getID() == TavnaziaTautusList[nt] and TavnaziaTautusList[nt+1][1] ~= 0) then
                    for nf = 1 ,TavnaziaTautusList[nt+1][1] , 1 do
                        for TauruslistID = 16949307 , 16949316 , 1 do
                            if (GetMobAction(TauruslistID ) == 0 ) then
                                SpawnMob(TauruslistID):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
                                GetMobByID(TauruslistID):setPos(X,Y,Z);
                                GetMobByID(TauruslistID):setSpawn(X,Y,Z);    
                                break;                                          
                            end
                        end                                                 
                    end                
                end
            end
        end        
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;
