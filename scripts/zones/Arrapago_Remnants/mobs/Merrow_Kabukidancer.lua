-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)
    local instance = mob:getInstance()
    instance:setProgress(instance:getProgress() + 1)
end;
