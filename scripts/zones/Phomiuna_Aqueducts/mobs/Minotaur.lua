-----------------------------------
-- Area: Phomiuna Aqueducts
--  MOB: Minotaur
-----------------------------------
mixins = {require("scripts/mixins/fomor_hate")}
require("scripts/globals/missions");
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("fomorHateAdj", -2);
end;

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(COP) == DISTANT_BELIEFS and player:getVar("PromathiaStatus") == 0) then
        player:setVar("PromathiaStatus",1);
    end
end;