-----------------------------------
-- Area: Ordelles Caves
--   NM: Gerwitz's Soul
-- Involved In Quest: Dark Puppet
-- !pos -51 0.1 3 193
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if player:getVar("darkPuppetCS") >= 4 then
        player:setVar("darkPuppetCS", 5)
    end
end