-----------------------------------
-- Area: Dynamis Xarcabard
--  MOB: Animated Shield
-----------------------------------
require("scripts/globals/status");
require("scripts/zones/Dynamis-Xarcabard/TextIDs");
-----------------------------------

function onMobEngaged(mob,target)

    if (mob:AnimationSub() == 3) then
        SetDropRate(113,1822,1000);
    else
        SetDropRate(113,1822,0);
    end

    target:showText(mob,ANIMATED_SHIELD_DIALOG);

    SpawnMob(17330290):updateEnmity(target);
    SpawnMob(17330291):updateEnmity(target);
    SpawnMob(17330292):updateEnmity(target);
    SpawnMob(17330299):updateEnmity(target);
    SpawnMob(17330300):updateEnmity(target);
    SpawnMob(17330301):updateEnmity(target);

end;

function onMobFight(mob,target)
    -- TODO: add battle dialog
end;

function onMobDisengage(mob)
    mob:showText(mob,ANIMATED_SHIELD_DIALOG+2);
end;

function onMobDeath(mob, player, isKiller)

    player:showText(mob,ANIMATED_SHIELD_DIALOG+1);

    DespawnMob(17330290);
    DespawnMob(17330291);
    DespawnMob(17330292);
    DespawnMob(17330299);
    DespawnMob(17330300);
    DespawnMob(17330301);

end;