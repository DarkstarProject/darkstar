-----------------------------------
-- Area: Bhaflau Thickets
--  MOB: Sea Puk
-- Note: Place holder Nis Puk
-----------------------------------
require("scripts/zones/Bhaflau_Thickets/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local mobID = mob:getID();
    if (Nis_Puk_PH[mobID] ~= nil) then
        local NP_ToD = GetServerVariable("[POP]Nis_Puk");
        if (NP_ToD <= os.time() and GetMobAction(Nis_Puk) == 0) then
            if (math.random(1,20) >= 1) then -- Give Sea Puk 5 percent chance to pop NP
                UpdateNMSpawnPoint(Nis_Puk);
                GetMobByID(Nis_Puk):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Nis_Puk", mobID);
                DisallowRespawn(mobID, true);
            end
        end
    end
end;
