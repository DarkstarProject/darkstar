-----------------------------------
-- Area: Dynamis Windurst
--  NPC: Haa Pevi the Stentorian
-- Boss Trigger for RDM NM
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("HpTrigger", math.random(40,65));
end;

function onMobFight(mob,target)
    if (mob:getHPP() < mob:getLocalVar("HpTrigger") and mob:getLocalVar("astral_flow") == 0) then
        mob:useMobAbility(1023);
        mob:setLocalVar("astral_flow", 1);
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)

    local bossTrigger = GetServerVariable("[DynaWindurst]Boss_Trigger");

    if (bossTrigger == 0 or bossTrigger == 1 or bossTrigger == 2 or bossTrigger == 3) then
        SetServerVariable("[DynaWindurst]Boss_Trigger",bossTrigger + 4);
        SpawnMob(17543588); -- 112
        SpawnMob(17543589); -- 113
    end

    -- If 3 first boss trigger are killed -> pop the last trigger
    if (GetServerVariable("[DynaWindurst]Boss_Trigger") == 7) then
        SpawnMob(17543590); -- 114
        SpawnMob(17543591); -- 115
        SpawnMob(17543592); -- 116
        SetServerVariable("[DynaWindurst]Boss_Trigger",8);
    end

end;