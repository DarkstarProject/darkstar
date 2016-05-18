-----------------------------------
-- Area: Dynamis Xarcabard
--  MOB: Animated Horn
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/Dynamis-Xarcabard/TextIDs");

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

    if (mob:AnimationSub() == 3) then
        SetDropRate(107,1584,1000);
    else
        SetDropRate(107,1584,0);
    end
    
    target:showText(mob,ANIMATED_HORN_DIALOG);
    
    SpawnMob(17330495,120):updateEnmity(target);
    SpawnMob(17330496,120):updateEnmity(target);
    SpawnMob(17330497,120):updateEnmity(target);
    SpawnMob(17330503,120):updateEnmity(target);
    SpawnMob(17330504,120):updateEnmity(target);
    SpawnMob(17330505,120):updateEnmity(target);

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
    mob:showText(mob,ANIMATED_HORN_DIALOG+2);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    
    player:showText(mob,ANIMATED_HORN_DIALOG+1);
    
    DespawnMob(17330495);
    DespawnMob(17330496);
    DespawnMob(17330497);
    DespawnMob(17330503);
    DespawnMob(17330504);
    DespawnMob(17330505);
    
end;