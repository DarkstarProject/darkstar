-----------------------------------
-- Area: West Saurtabaruta (S)
--  Mob: Toad
-- Note: Place holder Ramponneau
-----------------------------------

require("scripts/zones/West_Sarutabaruta_[S]/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

    local mobID = mob:getID();
    if (mobID == Ramponneau_PH) then
    
        Ramponneau_ToD = GetServerVariable("[POP]Ramponneau");
        if (Ramponneau_ToD <= os.time(t) and GetMobAction(Ramponneau) == 0 and math.random((1),(5)) == 5) then
            GetMobByID(Ramponneau):setRespawnTime(GetMobRespawnTime(mobID));
            SetServerVariable("[PH]Ramponneau", mobID);
            DeterMob(mobID, true);
        end
    end
end;