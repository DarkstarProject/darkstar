-----------------------------------
-- Area: Batallia Downs
--  MOB: Stalking Sapling
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/Batallia_Downs/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,72,1);
    checkRegime(ally,mob,73,1);

    mob = mob:getID();
    if (Tottering_Toby_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Tottering_Toby");
        if (ToD <= os.time(t) and GetMobAction(Tottering_Toby) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Tottering_Toby);
                GetMobByID(Tottering_Toby):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Tottering_Toby", mob);
                DeterMob(mob, true);
            end
        end
    end

end;
