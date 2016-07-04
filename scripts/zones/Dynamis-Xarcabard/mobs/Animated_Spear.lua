-----------------------------------
-- Area: Dynamis Xarcabard
--  MOB: Animated Spear
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/Dynamis-Xarcabard/TextIDs");

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

    if (mob:AnimationSub() == 3) then
        SetDropRate(114,1578,1000);
    else
        SetDropRate(114,1578,0);
    end
    
    target:showText(mob,ANIMATED_SPEAR_DIALOG);
    
    SpawnMob(17330423,120):updateEnmity(target);
    SpawnMob(17330424,120):updateEnmity(target);
    SpawnMob(17330425,120):updateEnmity(target);
    SpawnMob(17330435,120):updateEnmity(target);
    SpawnMob(17330436,120):updateEnmity(target);
    SpawnMob(17330437,120):updateEnmity(target);

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
    mob:showText(mob,ANIMATED_SPEAR_DIALOG+2);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    
    player:showText(mob,ANIMATED_SPEAR_DIALOG+1);
    
    DespawnMob(17330423);
    DespawnMob(17330424);
    DespawnMob(17330425);
    DespawnMob(17330435);
    DespawnMob(17330436);
    DespawnMob(17330437);
    
end;