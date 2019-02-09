-----------------------------------
-- Area: Ordelles Caves
--   NM: Gerwitz's Axe
-- Involved In Quest: Dark Puppet
-- !pos -51 0.1 3 193
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if player:getVar("darkPuppetCS") >= 2 then
        player:setVar("darkPuppetCS", 3)
    end
end