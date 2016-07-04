-----------------------------------
-- Area: Dynamis Xarcabard
--  MOB: Count Raum
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Xarcabard/TextIDs");

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    
    local Animate_Trigger = GetServerVariable("[DynaXarcabard]Boss_Trigger");
    
    if (mob:isInBattlefieldList() == false) then
        mob:addInBattlefieldList();
        Animate_Trigger = Animate_Trigger + 4;
        SetServerVariable("[DynaXarcabard]Boss_Trigger",Animate_Trigger);
        
        if (Animate_Trigger == 32767) then
            SpawnMob(17330911); -- 142
            SpawnMob(17330912); -- 143
            SpawnMob(17330177); -- Dynamis Lord
            GetMobByID(17330183):setSpawn(-364,-35.661,17.254); -- Set Ying and Yang's spawn points to their initial spawn point.
            GetMobByID(17330184):setSpawn(-364,-35.974,24.254);
            SpawnMob(17330183);
            SpawnMob(17330184);
            
            activateAnimatedWeapon(); -- Change subanim of all animated weapon
        end
    end
    
    if (Animate_Trigger == 32767) then
        player:messageSpecial(PRISON_OF_SOULS_HAS_SET_FREE);
    end
    
end;