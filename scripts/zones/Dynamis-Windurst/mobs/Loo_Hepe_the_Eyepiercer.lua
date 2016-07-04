-----------------------------------
-- Area: Dynamis Windurst
-- NPC:  Loo Hepe the Eyepiercer
-- Boss Trigger for MEGA BOSS
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

    -- If last boss trigger is killed -> pop the boss
    if (GetServerVariable("[DynaWindurst]Boss_Trigger") == 8) then
        SpawnMob(17543169);
        SetServerVariable("[DynaWindurst]Boss_Trigger",16);
    end

end;