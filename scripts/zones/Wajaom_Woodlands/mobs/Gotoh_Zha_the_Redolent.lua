-----------------------------------
-- Area: Wajaom Woodlands
--  ZNM: Gotoh Zha the Redolent
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------
-- Detailed Notes & Todos
-- (please remove these if you handle any)
-- 1. Find out if stats (INT, MND, MAB..)
--    actually change when it switches mode on retail.
-- 2. Correct mobskill use behavior:
--    Will always do Groundburst after Warm-Up,
--    will never use Groundburst without a preceding Warm-Up.
--    will not attempt any other TP attacks until Groundburst finished
--    (either landed or failed from lack of targets, resetting his TP)
-- 3. Will Rage 1 hour after it is popped. Firespit can land over 1500 dmg during rage.
--    If rage is reset/removed its 2hrs are also reset.
-- 4. This NM also shows some insight into retail mob 2hrs/1hrs:
--    they actually have the same cooldown as players and only
--    time, respawn, or rage loss will reset them.
-- 5. All the onCriticalHit and onWeaponskillHit in DSP should eventually be mixins.
--    onCritical also needs a target argument added to it for other mobs.
-- 6. Speaking of those two functions..
--    We have no data on the weapon break chance, went with 10% on both for now.
--    Do crit ws hits count differently than regular ws hits on retail?
--    Should onCriticalHit count WS crit hits if regular WS hits do not count?
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    -- useMainSpecAtHPP needs set every spawn or it defaults to 46-60
    mob:setLocalVar("useSpecAtHpMin", 66)
    mob:setLocalVar("useSpecAtHpMax", 95)
    -- variables because wide line.
    local hpMin =  mob:getLocalVar("useSpecAtHpMin")
    local hpMax =  mob:getLocalVar("useSpecAtHpMax")
    -- This also happens every claim loss in the mixin, so had to set all 3.
    mob:setLocalVar("useSubSpecAtHPP", math.random(hpMin, hpMax))
    --[[
        The "job change" in this script isn't an actual job change
        and we're unsure if mobs actual stats are blm/whm or whm/blm
        so we're resetting mainSpec on spawn in case of future changes
    ]]
    mob:setLocalVar("mainSpec", dsp.jsa.MANAFONT)

    -- spell list and aniSub should happen automatic but we're doing this just in case
    mob:AnimationSub(0) -- Retrieve that Staff
    mob:setSpellList(296) -- Set BLM spell list
end

function onMobFight(mob, target)
    if mob:AnimationSub() == 1 and mob:getLocalVar("jobChanged") == 0 then
        mob:setLocalVar("jobChanged", 1)
        mob:setSpellList(297) -- Set WHM spell list.

        -- set new JSA parameters
        mob:setLocalVar("mainSpec", dsp.jsa.BENEDICTION)
        mob:setLocalVar("useSpecAtHpMin", 20)
        mob:setLocalVar("useSpecAtHpMax", 50)
        -- variables because wide line.
        local hpMin =  mob:getLocalVar("useSpecAtHpMin")
        local hpMax =  mob:getLocalVar("useSpecAtHpMax")
        -- This also happens every claim loss in the mixin, so have to set all 3.
        mob:setLocalVar("useSubSpecAtHPP", math.random(hpMin, hpMax))
        mob:setLocalVar("usedSubSpec", 0)
    end
end

function onCriticalHit(mob)
    local RND = math.random(1, 100)
    if mob:AnimationSub() == 0 and RND <= 10 then
        mob:AnimationSub(1)
    end
end

function onWeaponskillHit(mob, attacker, weaponskill)
    local RND = math.random(1, 100)
    if mob:AnimationSub() == 0 and RND <= 10 then
        mob:AnimationSub(1)
    end

    return 0
end

function onMobDeath(mob, killer)
end
