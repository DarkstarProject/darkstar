require("scripts/globals/mixins");
require("scripts/globals/utils");

g_mixins = g_mixins or {};

g_mixins.fomor_hate = function(mob)
    mob:addListener("DEATH", "FOMOR_HATE_DEATH", function(mob, player, isKiller)
        local hate = player:getVar("FOMOR_HATE");
        local adj = mob:getLocalVar("fomorHateAdj");
        if (adj == 0) then adj = 2 end; -- most fomor add 2 hate
        player:setVar("FOMOR_HATE", utils.clamp(hate + adj, 0, 60));
    end)
end

return g_mixins.fomor_hate;
