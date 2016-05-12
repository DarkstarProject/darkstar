-----------------------------------
-- Area: Dynamis Windurst
-- NPC:  Xoo Kaza the Solemn
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

    if (bossTrigger == 0 or bossTrigger == 1 or bossTrigger == 4 or bossTrigger == 5) then
        SetServerVariable("[DynaWindurst]Boss_Trigger",bossTrigger + 2);
        SpawnMob(17543586); -- 110
        SpawnMob(17543587); -- 111
    end

    -- If 3 first boss trigger are killed -> pop the last trigger
    if (GetServerVariable("[DynaWindurst]Boss_Trigger") == 7) then
        SpawnMob(17543590); -- 114
        SpawnMob(17543591); -- 115
        SpawnMob(17543592); -- 116
        SetServerVariable("[DynaWindurst]Boss_Trigger",8);
    end

end;