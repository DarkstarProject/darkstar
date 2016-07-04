-----------------------------------
-- Area: Dynamis Xarcabard
--  MOB: Animated Longbow
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/Dynamis-Xarcabard/TextIDs");

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

    if (mob:AnimationSub() == 3) then
        SetDropRate(110,1583,1000);
    else
        SetDropRate(110,1583,0);
    end
    
    target:showText(mob,ANIMATED_LONGBOW_DIALOG);
    
    SpawnMob(17330522,120):updateEnmity(target);
    SpawnMob(17330523,120):updateEnmity(target);
    SpawnMob(17330524,120):updateEnmity(target);
    SpawnMob(17330525,120):updateEnmity(target);
    SpawnMob(17330526,120):updateEnmity(target);
    SpawnMob(17330527,120):updateEnmity(target);

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
    mob:showText(mob,ANIMATED_LONGBOW_DIALOG+2);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    
    player:showText(mob,ANIMATED_LONGBOW_DIALOG+1);
    
    DespawnMob(17330522);
    DespawnMob(17330523);
    DespawnMob(17330524);
    DespawnMob(17330525);
    DespawnMob(17330526);
    DespawnMob(17330527);
    
end;