-----------------------------------
-- Area: Ordelles Caves
--  MOB: Polevik
-- Involved In Quest: Dark Puppet
-- !pos -51 0.1 3 193
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)

    if (player:getVar("sharpeningTheSwordCS") == 3) then
        player:setVar("PolevikKilled",1);
        player:setVar("Polevik_Timer",os.time());
    end

end;