-----------------------------------
-- Area: Ordelles Caves
--  MOB: Polevik
-- Involved In Quest: Dark Puppet
-- @pos -51 0.1 3 193
-----------------------------------

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)

    if (ally:getVar("sharpeningTheSwordCS") == 3) then
        ally:setVar("PolevikKilled",1);
        ally:setVar("Polevik_Timer",os.time());
    end

end;