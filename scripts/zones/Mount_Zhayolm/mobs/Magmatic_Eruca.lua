-----------------------------------
-- Area: Mount Zhayolm
-- NPC:  Magmatic Eruca
-- Note: Place Holder Energetic Eruca
-----------------------------------

require("scripts/zones/Mount_Zhayolm/MobIDs");

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

    -- Get Magmatic Eruca ID and check if it is a PH of EE
    mob = mob:getID();

    -- Check if Magmatic Eruca is within the Magmatic_Eruca_PH table
    if (Energetic_Eruca_PH[mob] ~= nil) then
        -- printf("%u is a PH",mob);
        -- Get EnE's previous ToD
        EnE_ToD = GetServerVariable("[POP]Energetic_Eruca");

        -- Check if EnE window is open, and there is not an EnE popped already(ACTION_NONE = 0)
        if (EnE_ToD <= os.time(t) and GetMobAction(Energetic_Eruca) == 0) then

            -- printf("EnE window open");
            -- Give Magmatic Eruca 10 percent chance to pop EnE
            if (math.random(1,10) == 5) then
                -- printf("EnE will pop");
                UpdateNMSpawnPoint(Energetic_Eruca);
                GetMobByID(Energetic_Eruca):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Energetic_Eruca", mob);
                DeterMob(mob, true);
            end
        end
    end

end;	
