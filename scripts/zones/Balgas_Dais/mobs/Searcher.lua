-----------------------------------
-- Area: Balga's Dais
--  MOB: Searcher
-- Mission 2-3 BCNM Fight
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.HP_STANDBACK, 50);
end;

function onMobDeath(mob, player, isKiller)
end;
