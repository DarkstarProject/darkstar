-----------------------------------
-- Area: Batallia Downs
-- NPC:  Sturmtiger
-- Involved in Quest: Chasing Quotas
-- @pos -715.882,-10.75,65.982 (105)
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer,ally)
    if (ally:getVar("ChasingQuotas_Progress") == 5) then
        ally:setVar("SturmtigerKilled",1);
    end
end;