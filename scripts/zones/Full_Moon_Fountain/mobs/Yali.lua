-----------------------------------
-- Area: Full Moon Fountain
--  Mob: Yali
-- Windurst Mission 9-2
-----------------------------------
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setSpellList(135);
end;

function onMobDeath(mob, player, isKiller)
end;
