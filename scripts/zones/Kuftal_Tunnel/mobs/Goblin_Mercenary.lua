-----------------------------------	
-- Area: Kuftal Tunnel	
-- MOB:  Goblin Mercenary	
-- Note: Place Holder for Bloodthirster Madkix
-----------------------------------	

require("scripts/zones/Kuftal_Tunnel/MobIDs");
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

    mob = mob:getID();
    if (Bloodthirster_Madkix_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Bloodthirster_Madkix");
        if (ToD <= os.time(t) and GetMobAction(Bloodthirster_Madkix) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Bloodthirster_Madkix);
                GetMobByID(Bloodthirster_Madkix):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Bloodthirster_Madkix", mob);
                DeterMob(mob, true);
            end
        end
    end
end;	
