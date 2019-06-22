--[[
Mobs that enter rage mode after a specified amount of time in combat. Controlled by following vars that can be set onMobSpawn:

localVar    default     description
--------    -------     -----------
rageTimer   1200        seconds into combat at which point the mob will rage.

https://ffxiclopedia.fandom.com/wiki/Rage
--]]

require("scripts/globals/mixins")
require("scripts/globals/status")

g_mixins = g_mixins or {}

g_mixins.rage = function(mob)

    mob:addListener("SPAWN", "RAGE_SPAWN", function(mob)
        mob:setLocalVar("[rage]timer", 1200) -- 20 minutes
    end)

    mob:addListener("ENGAGE", "RAGE_ENGAGE", function(mob)
        mob:setLocalVar("[rage]at", os.time() + mob:getLocalVar("[rage]timer"))
    end)

    mob:addListener("COMBAT_TICK", "RAGE_CTICK", function(mob)
        if mob:getLocalVar("[rage]started") == 0 and os.time() > mob:getLocalVar("[rage]at") then
            mob:setLocalVar("[rage]started", 1)

            -- boost stats
            for i = dsp.mod.STR, dsp.mod.CHR do
                local amt = math.ceil(mob:getStat(i) * 9)
                mob:setLocalVar("[rage]mod_" .. i, amt)
                mob:addMod(i, amt)
            end

            -- TODO: ATT, DEF, MACC, MATT, EVA, attack speed all increase
        end
    end)

    -- Todo: should happen when mob begins to regen while unclaimed. If 1st healing tick hasn't happened, retail mob is stil raged.
    mob:addListener("DISENGAGE", "RAGE_DISENGAGE", function(mob)
        if mob:getLocalVar("[rage]started") == 1 then
            mob:setLocalVar("[rage]started", 0)

            -- unboost stats
            for i = dsp.mod.STR, dsp.mod.CHR do
                local amt = mob:getLocalVar("[rage]mod_" .. i)
                mob:delMod(i, amt)
            end

            -- TODO: ATT, DEF, MACC, MATT, EVA, attack speed all decrease
        end
    end)

end

return g_mixins.rage