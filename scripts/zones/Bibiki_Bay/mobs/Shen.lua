-----------------------------------
-- Area: bibiki bay
-- NPC:  Shen
-----------------------------------
-----------------------------------

require("scripts/zones/Bibiki_Bay/TextIDs");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;


function onMonsterMagicPrepare(mob, target)
    -- casts Water IV, Waterga III, Flood, Drown 
    rnd = math.random();
    
    if (rnd < 0.5) then
        return 201; -- waterga 3
    elseif (rnd < 0.7) then
         return 172; -- water 4
    elseif (rnd < 0.9) then
        return 214; -- flood
    else
        return 240; -- drown
    end
    
end;