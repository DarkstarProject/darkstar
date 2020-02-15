-----------------------------------
-- Area: La Theine Plateau
--  Mob: Nihniknoovi
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 600);
end;

function onMobDeath(mob, player, isKiller)
    if player:getCharVar("TutorialProgress") == 7 then
        player:setCharVar("TutorialProgress", 8)
    end
end;