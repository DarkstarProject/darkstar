-----------------------------------
-- Area: Throne Room 165
-- MOB: Riko Kupenreich
-- Mission AMK14 Fight
-----------------------------------

function onMobSpawn(mob)
    mob:addListener("COMBAT_TICK", "RIKO_CTICK", function(mob)
        if mob:getHPP() <= 25 then
            mob:getBattlefield():win()
        end
    end)
end

function onMobDeath(mob, player, isKiller)
end
