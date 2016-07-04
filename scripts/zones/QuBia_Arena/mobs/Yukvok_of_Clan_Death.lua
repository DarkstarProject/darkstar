-----------------------------------
-- Area: QuBia_Arena
-- Mission 9-2 SANDO
-----------------------------------


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobRoam
-----------------------------------
function onMobRoam(mob)
    mob:setLocalVar("2HGO",math.random(50,99));
end;

-----------------------------------
-- onMobFight
-----------------------------------
function onMobFight(mob,target)
    if (mob:getLocalVar("2HOUR") == 0) then
        if (mob:getHPP() < mob:getLocalVar("2HGO")) then
            mob:setLocalVar("2HOUR",1);
            mob:useMobAbility(735);
        end
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    local mobs = {{17621017,17621018,17621019,17621020,17621021,17621022,17621023,17621024,17621025,17621026,17621027},{17621031,17621032,17621033,17621034,17621035,17621036,17621037,17621038,17621039,17621040,17621041},{17621031,17621046,17621047,17621048,17621049,17621050,17621051,17621052,17621053,17621054,17621055}};
    local inst = player:getBattlefield():getBattlefieldNumber();
    local victory = true
    for i,v in ipairs(mobs[inst]) do
        local action = GetMobAction(v);
        printf("action %u",action);
        if not(action == 0 or (action >= 21 and action <= 23)) then
            victory = false
        end
    end

    if (victory == true) then
        player:startEvent(0x7d04,0,0,4);
    end

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
    if (csid == 0x7d04) then
        if (player:getBattlefield():getBattlefieldNumber() == 1) then
            SpawnMob(17621014);
            SpawnMob(17621015);
            SpawnMob(17621016);
            local trion = player:getBattlefield():insertAlly(14183)
            trion:setSpawn(-403,-201,413,58);
            trion:spawn();
            player:setPos(-400,-201,419,61);
        elseif (player:getBattlefield():getBattlefieldNumber() == 2) then
            SpawnMob(17621028);
            SpawnMob(17621029);
            SpawnMob(17621030);
            local trion = player:getBattlefield():insertAlly(14183)
            trion:setSpawn(-3,-1,4,61);
            trion:spawn();
            player:setPos(0,-1,10,61);
        elseif (player:getBattlefield():getBattlefieldNumber() == 3) then
            SpawnMob(17621042);
            SpawnMob(17621043);
            SpawnMob(17621044);
            local trion = player:getBattlefield():insertAlly(14183)
            trion:setSpawn(397,198,-395,64);
            trion:spawn();
            player:setPos(399,198,-381,57);
        end
    end
end;
