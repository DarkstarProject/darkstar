-----------------------------------
-- Area: Batillia Downs S
--  MOB: Gnole
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("transformTime", os.time())
end;

-----------------------------------
-- onMobRoam Action
-----------------------------------
function onMobRoam(mob)
    local changeTime = mob:getLocalVar("transformTime");
    local roamChance = math.random(1,100);
    local roamMoonPhase = VanadielMoonPhase();

    if (roamChance > 100-roamMoonPhase) then
        if (mob:AnimationSub() == 0 and os.time() - changeTime > 300) then
            mob:AnimationSub(1);
            mob:setLocalVar("transformTime", os.time());
        elseif (mob:AnimationSub() == 1 and os.time() - changeTime > 300) then
            mob:AnimationSub(0);
            mob:setLocalVar("transformTime", os.time());
        end
    end
end;

-----------------------------------
-- onMobEngaged
-- Change forms every 60 seconds
-----------------------------------

function onMobEngaged(mob,target)
    local changeTime = mob:getLocalVar("changeTime");
    local chance = math.random(1,100);
    local moonPhase = VanadielMoonPhase();

    if (chance > 100-moonPhase) then
        if (mob:AnimationSub() == 0 and mob:getBattleTime() - changeTime > 45) then
            mob:AnimationSub(1);
            mob:setLocalVar("changeTime", mob:getBattleTime());
        elseif (mob:AnimationSub() == 1 and mob:getBattleTime() - changeTime > 45) then
            mob:AnimationSub(0);
            mob:setLocalVar("changeTime", mob:getBattleTime());
        end
    end
end;