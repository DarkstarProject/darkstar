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

function onMobDeath(mob,killer,ally)

    if (ally:getVar("darkPuppetCS") >= 2) then
        ally:setVar("darkPuppetCS",3);
    end

end;