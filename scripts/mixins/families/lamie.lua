require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

-- AnimationSub for Lamie
-- 0 = main weapon out, sub weapon sheathed
-- 1 = main weapon broken, sub weapon sheathed

g_mixins.families.lamie = function(mob)

    -- set default 10% chance to break weapon on critical hit taken
    -- this can be overridden in onMobSpawn

    mob:addListener("SPAWN", "LAMIE_SPAWN", function(mob)
        mob:setLocalVar("lamiaBreakChance", 10)
    end)

    -- chance to break weapon when taking a critical hit

    mob:addListener("CRITICAL_TAKE", "LAMIE_CRITICAL_TAKE", function(mob)
        if math.random(100) <= mob:getLocalVar("lamiaBreakChance") then
            local animationSub = mob:AnimationSub()

            -- break weapon
            if animationSub == 0 then
                mob:AnimationSub(1)
            end
        end

    end)

end

return g_mixins.families.lamie
