----------------------------------
-- Area: Gustav Tunnel
--  MOB: Erlik
-- Note: Place holder Baobhan Sith
-----------------------------------

require("scripts/zones/Gustav_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

    checkGoVregime(killer,mob,767,2);

    local mob = mob:getID();
    if (Baobhan_Sith_PH[mob] ~= nil) then

        local ToD = GetServerVariable("[POP]Baobhan_Sith");
        if (ToD <= os.time(t) and GetMobAction(Baobhan_Sith) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Baobhan_Sith);
                GetMobByID(Baobhan_Sith):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Baobhan_Sith", mob);
                DeterMob(mob, true);
            end
        end
    end

end;
