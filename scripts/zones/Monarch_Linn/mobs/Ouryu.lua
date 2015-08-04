-----------------------------------
-- Area:
-- NPC:  Ouryu
-----------------------------------
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

function onMobFight(mob,target)

    if (mob:hasStatusEffect(EFFECT_INVINCIBLE) == false and mob:actionQueueEmpty() == true) then
        local changeTime = mob:getLocalVar("changeTime");
        local twohourTime = mob:getLocalVar("twohourTime");

        if (twohourTime == 0) then
            twohourTime = math.random(8, 14);
            mob:setLocalVar("twohourTime", twohourTime);
        end

        if (mob:AnimationSub() == 2 and mob:getBattleTime()/15 > twohourTime) then
            mob:useMobAbility(438);
            mob:setLocalVar("twohourTime", math.random((mob:getBattleTime()/15)+12, (mob:getBattleTime()/15)+16));
        elseif (mob:AnimationSub() == 0 and mob:getBattleTime() - changeTime > 60) then
            mob:AnimationSub(1);
            mob:addStatusEffectEx(EFFECT_ALL_MISS, 0, 1, 0, 0);
            mob:SetMobSkillAttack(true);
            --and record the time this phase was started
            mob:setLocalVar("changeTime", mob:getBattleTime());
        -- subanimation 1 is flight, so check if he should land
        elseif (mob:AnimationSub() == 1 and
                mob:getBattleTime() - changeTime > 120) then
            mob:useMobAbility(1046);
            mob:setLocalVar("changeTime", mob:getBattleTime());
        -- subanimation 2 is grounded mode, so check if he should take off
        elseif (mob:AnimationSub() == 2 and
                mob:getBattleTime() - changeTime > 120) then
            mob:AnimationSub(1);
            mob:addStatusEffectEx(EFFECT_ALL_MISS, 0, 1, 0, 0);
            mob:SetMobSkillAttack(true);
            mob:setLocalVar("changeTime", mob:getBattleTime());
        end
	end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	killer:addTitle(MIST_MELTER);

end;