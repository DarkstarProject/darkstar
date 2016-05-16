-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--  MOB: Doomed Pilgrims
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)

    if (GetServerVariable("[ZM4]Light_Headstone_Active") == 0) then
        SetServerVariable("[ZM4]Light_Headstone_Active",os.time()+ 900);
    end

end;