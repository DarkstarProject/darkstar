-----------------------------------
-- Area: Mount Zhayolm
--  MOB: Magmatic Eruca
-- Note: Place Holder Energetic Eruca
-----------------------------------

require("scripts/zones/Mount_Zhayolm/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    -- Get Magmatic Eruca ID and check if it is a PH of EE
    local mobID = mob:getID();

    -- Check if Magmatic Eruca is within the Magmatic_Eruca_PH table
    if (Energetic_Eruca_PH[mobID] ~= nil) then
        -- printf("%u is a PH",mobID);
        -- Get EnE's previous ToD
        local EnE_ToD = GetServerVariable("[POP]Energetic_Eruca");
        local checkPH = GetServerVariable("[PH]Energetic_Eruca");

        -- Check if EnE window is open, and there is not an EnE popped already(ACTION_NONE = 0)
        if (EnE_ToD <= os.time() and GetMobAction(Energetic_Eruca) == 0) then
            -- printf("EnE window open");
            -- Give Magmatic Eruca 10 percent chance to pop EnE
            if (math.random(1,10) == 5) then
                -- printf("EnE will pop");
                UpdateNMSpawnPoint(Energetic_Eruca);
                GetMobByID(Energetic_Eruca):setRespawnTime(GetMobRespawnTime(mobID));
                if (checkPH == 0) then
                    SetServerVariable("[PH]Energetic_Eruca", mobID);
                    DisallowRespawn(mobID, true);
                end
            end
        end
    end

end;
