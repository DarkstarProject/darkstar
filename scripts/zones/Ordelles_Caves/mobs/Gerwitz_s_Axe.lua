-----------------------------------
-- Area: Ordelles Caves
--  MOB: Gerwitz's Axe
-- Involved In Quest: Dark Puppet
-- @pos -51 0.1 3 193
-----------------------------------

require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    if (player:getVar("darkPuppetCS") >= 2) then
        player:setVar("darkPuppetCS",3);
    end

end;