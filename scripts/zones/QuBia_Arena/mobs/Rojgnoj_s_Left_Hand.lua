-----------------------------------
-- Area: QuBia_Arena
-- Mission 9-2 SANDO
-----------------------------------


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("2HGO",math.random(40,80));
end;

-----------------------------------
-- onMobFight
-----------------------------------
function onMobFight(mob,target)
    if (mob:getLocalVar("2HOUR") == 0) then
        if (mob:getHPP() < mob:getLocalVar("2HGO")) then
            mob:setLocalVar("2HOUR",1);
            mob:useMobAbility(691);
        end
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    mob:setLocalVar("2HOUR",0);
    mob:setLocalVar("2HGO",0);
end;
-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    printf("finishCSID: %u",csid);
    printf("RESULT: %u",option);
end;
