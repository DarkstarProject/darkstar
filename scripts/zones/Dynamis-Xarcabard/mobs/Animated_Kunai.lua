-----------------------------------
-- Area: Dynamis Xarcabard
--  MOB: Animated Kunai
-----------------------------------
require("scripts/globals/status");
require("scripts/zones/Dynamis-Xarcabard/TextIDs");
-----------------------------------

function onMobEngaged(mob,target)

    if (mob:AnimationSub() == 3) then
        SetDropRate(109,1579,1000);
    else
        SetDropRate(109,1579,0);
    end

    target:showText(mob,ANIMATED_KUNAI_DIALOG);

    SpawnMob(17330442):updateEnmity(target);
    SpawnMob(17330443):updateEnmity(target);
    SpawnMob(17330444):updateEnmity(target);
    SpawnMob(17330454):updateEnmity(target);
    SpawnMob(17330455):updateEnmity(target);
    SpawnMob(17330456):updateEnmity(target);

end;

function onMobFight(mob,target)
    -- TODO: add battle dialog
end;

function onMobDisengage(mob)
    mob:showText(mob,ANIMATED_KUNAI_DIALOG+2);
end;

function onMobDeath(mob, player, isKiller)

    player:showText(mob,ANIMATED_KUNAI_DIALOG+1);

    DespawnMob(17330442);
    DespawnMob(17330443);
    DespawnMob(17330444);
    DespawnMob(17330454);
    DespawnMob(17330455);
    DespawnMob(17330456);

end;