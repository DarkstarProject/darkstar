-----------------------------------
-- Area: Batallia Downs
--  NPC: Sturmtiger
-- Involved in Quest: Chasing Quotas
-- !pos -715.882,-10.75,65.982 (105)
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    if (player:getVar("ChasingQuotas_Progress") == 5) then
        player:setVar("SturmtigerKilled",1);
    end
end;