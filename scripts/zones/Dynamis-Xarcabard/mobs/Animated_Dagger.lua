-----------------------------------
-- Area: Dynamis Xarcabard
--  MOB: Animated Dagger
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/Dynamis-Xarcabard/TextIDs");

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

    if (mob:AnimationSub() == 3) then
        SetDropRate(103,1572,1000);
    else
        SetDropRate(103,1572,0);
    end
    
    target:showText(mob,ANIMATED_DAGGER_DIALOG);
    
    SpawnMob(17330306,120):updateEnmity(target);
    SpawnMob(17330307,120):updateEnmity(target);
    SpawnMob(17330308,120):updateEnmity(target);
    SpawnMob(17330316,120):updateEnmity(target);
    SpawnMob(17330317,120):updateEnmity(target);
    SpawnMob(17330318,120):updateEnmity(target);

end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
    -- TODO: add battle dialog
end;

-----------------------------------
-- onMobDisengage
-----------------------------------

function onMobDisengage(mob)
    mob:showText(mob,ANIMATED_DAGGER_DIALOG+2);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    
    player:showText(mob,ANIMATED_DAGGER_DIALOG+1);
    
    DespawnMob(17330306);
    DespawnMob(17330307);
    DespawnMob(17330308);
    DespawnMob(17330316);
    DespawnMob(17330317);
    DespawnMob(17330318);
    
end;