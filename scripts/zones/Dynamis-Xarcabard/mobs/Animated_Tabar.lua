-----------------------------------
-- Area: Dynamis Xarcabard
--  MOB: Animated Tabar
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/Dynamis-Xarcabard/TextIDs");

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

    if (mob:AnimationSub() == 3) then
        SetDropRate(116,1575,1000);
    else
        SetDropRate(116,1575,0);
    end
    
    target:showText(mob,ANIMATED_TABAR_DIALOG);
    
    SpawnMob(17330380,120):updateEnmity(target);
    SpawnMob(17330381,120):updateEnmity(target);
    SpawnMob(17330382,120):updateEnmity(target);
    SpawnMob(17330392,120):updateEnmity(target);
    SpawnMob(17330393,120):updateEnmity(target);
    SpawnMob(17330394,120):updateEnmity(target);

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
    mob:showText(mob,ANIMATED_TABAR_DIALOG+2);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    
    player:showText(mob,ANIMATED_TABAR_DIALOG+1);
    
    DespawnMob(17330380);
    DespawnMob(17330381);
    DespawnMob(17330382);
    DespawnMob(17330392);
    DespawnMob(17330393);
    DespawnMob(17330394);
    
end;