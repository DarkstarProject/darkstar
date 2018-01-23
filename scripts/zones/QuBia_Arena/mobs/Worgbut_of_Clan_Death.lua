-----------------------------------
-- Area: QuBia_Arena
-- Mission 9-2 SANDO
-----------------------------------
require("scripts/zones/QuBia_Arena/MobIDs");

function onMobSpawn(mob)
end;

function onMobFight(mob,target)
end;

function onMobDeath(mob, player, isKiller)
    local inst = player:getBattlefield():getBattlefieldNumber();
    local victory = true
    for i,v in ipairs(MOBLIST[inst]) do
        if (not GetMobByID(v):isDead()) then
            victory = false
        end
    end

    if (victory == true) then
        player:startEvent(32004,0,0,4);
    end
end;
