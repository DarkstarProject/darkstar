-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Carthi
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
    if (isKiller) then -- Causes this to only run once per Carthi kill
        if (GetServerVariable("[ZM4]Fire_Headstone_Active") == 0) then
            SetServerVariable("[ZM4]Fire_Headstone_Active",1);
        elseif (GetServerVariable("[ZM4]Fire_Headstone_Active") == 1) then
            SetServerVariable("[ZM4]Fire_Headstone_Active",os.time()+ 900);
        end
    end
end;

-----------------------------------
-- onMobDespawn Action
-----------------------------------

function onMobDespawn(mob)
end;
