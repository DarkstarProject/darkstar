-----------------------------------
-- Area: Wajaom Woodlands
--  ZNM: Gotoh Zha the Redolent
-----------------------------------
-- Notes & Todos
-- 1. Find out if stats (INT, MND, MAB..)
--    actually change when it switches mode on retail.
-- 2. Convert 2hrs to the new mixin form?
-- 3. Correct mobskill use behavior:
--    Will always do Groundburst after Warm-Up,
--    will never use Groundburst without a preceding Warm-Up.
--    will not attempt any other TP attacks until Groundburst finished
--    (either landed or failed from lack of targets, resetting his TP)
-- 4. Will Rage 1 hour after it is popped. Firespit can land over 1500 dmg during rage.
--    If rage is reset/removed its 2hrs are also reset.
-- 5. This NM also shows some insight into retail mob 2hrs/1hrs:
--    they actually have the same cooldown as players and only
--    time, respawn, or rage loss will reset them.
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    -- Randomize HP for 2hr on each pop.
    mob:setLocalVar("RANDHPP_1", math.random(66,95))
    mob:setLocalVar("RANDHPP_2", math.random(20,50))

    -- This should happen automatic but we're doing this just in case
    mob:AnimationSub(0) -- Retrieve that Staff
    mob:setSpellList(296) -- Set BLM spell list
end

function onMobFight(mob, target)
    local RHP1 = mob:getLocalVar("RANDHPP_1")
    local RHP2 = mob:getLocalVar("RANDHPP_2")

    if mob:AnimationSub() == 0 and mob:getHPP() <= RHP1 and mob:getLocalVar("Manafont") == 0 then
        mob:setLocalVar("Manafont", 1)
        mob:useMobAbility(dsp.jobSpecialAbility.MANAFONT)
    elseif mob:AnimationSub() == 1 and mob:getHPP() <= RHP2 and mob:getLocalVar("Benediction") == 0 then
        mob:setLocalVar("Benediction", 1)
        mob:useMobAbility(dsp.jobSpecialAbility.BENEDICTION)
    end

    if mob:AnimationSub() == 1 and mob:getLocalVar("jobChange") == 0 then
        mob:setSpellList(297) -- Set WHM spell list.
        mob:setLocalVar("jobChange", 1)
    end
end

function onCriticalHit(mob)
    local RND = math.random(1, 100)
    -- No data on the weapon break chance, went with 10% for now.
    if mob:AnimationSub() == 0 and RND <= 10 then
        mob:AnimationSub(1)
    end
end

function onWeaponskillHit(mob, attacker, weaponskill)
    local RND = math.random(1, 100)
    -- No data on the weapon break chance, went with 10% for now.
    if mob:AnimationSub() == 0 and RND <= 10 then
        mob:AnimationSub(1)
    end

    return 0
end

function onMobDeath(mob, killer)
end
