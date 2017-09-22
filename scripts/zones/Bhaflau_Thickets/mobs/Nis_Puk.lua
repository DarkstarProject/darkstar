-----------------------------------
-- Area: Bhaflau Thickets
--  NM:  Nis_Puk
-- !pos -155.319 -15.959 -599.366 52
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

    -- Set NP's ToD
    SetServerVariable("[POP]Nis_Puk", os.time() + 43200); -- 12 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Nis_Puk");
    SetServerVariable("[PH]Nis_Puk", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;
