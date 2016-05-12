-----------------------------------
-- Area: Dynamis Windurst
-- NPC:  Wuu Qoho the Razorclaw
-- Boss Trigger for RDM NM
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local bossTrigger = GetServerVariable("[DynaWindurst]Boss_Trigger");

    if (bossTrigger == 0 or bossTrigger == 2 or bossTrigger == 4 or bossTrigger == 6) then
        SetServerVariable("[DynaWindurst]Boss_Trigger",bossTrigger + 1);
        SpawnMob(17543584); -- 108
        SpawnMob(17543585); -- 109
    end

    -- If 3 first boss trigger are killed -> pop the last trigger
    if (GetServerVariable("[DynaWindurst]Boss_Trigger") == 7) then
        SpawnMob(17543590); -- 114
        SpawnMob(17543591); -- 115
        SpawnMob(17543592); -- 116
        SetServerVariable("[DynaWindurst]Boss_Trigger",8);
    end

end;