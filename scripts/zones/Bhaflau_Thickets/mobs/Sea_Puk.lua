-----------------------------------	
-- Area: Bhaflau Thickets	
-- MOB:  Sea Puk
-- Note: Place holder Nis Puk
-----------------------------------	

require("scripts/zones/Bhaflau_Thickets/MobIDs");
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

    -- Get Sea Puk ID and check if it is a PH of NP
    mob = mob:getID();

    -- Check if Sea Puk is within the Nis_Puk_PH table
    if (Nis_Puk_PH[mob] ~= nil) then
        -- printf("%u is a PH",mob);
        -- Get NP's previous ToD
        NP_ToD = GetServerVariable("[POP]Nis_Puk");

        -- Check if NP window is open, and there is not an NP popped already(ACTION_NONE = 0)
        if (NP_ToD <= os.time(t) and GetMobAction(Nis_Puk) == 0) then

            -- printf("NP window open");
            -- Give Sea Puk 5 percent chance to pop NP
            if (math.random(1,20) >= 1) then
                -- printf("NP will pop");
                UpdateNMSpawnPoint(Nis_Puk);
                GetMobByID(Nis_Puk):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Nis_Puk", mob);
                DeterMob(mob, true);
            end
        end
    end

end;	

