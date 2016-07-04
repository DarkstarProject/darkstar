-----------------------------------
-- Area: Den of Rancor
--  MOB: Celeste-eyed Tozberry
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local kills = player:getVar("EVERYONES_GRUDGE_KILLS");
    if (kills < 480) then
        player:setVar("EVERYONES_GRUDGE_KILLS",kills + 1);
    end
end;