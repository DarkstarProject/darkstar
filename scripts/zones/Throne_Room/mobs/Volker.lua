-----------------------------------
-- Area: Throne Room
--  MOB: Volker
-- Throne room volker npc bastok mission 9-2
-----------------------------------


function onMobRoam(mob)
    local wait = mob:getLocalVar("wait");
    local ready = mob:getLocalVar("ready");
    if (ready == 0 and wait > 40) then local baseID = 17453064 + (mob:getBattlefield():getBattlefieldNumber() - 1) * 4
        mob:setLocalVar("ready", bit.band(baseID, 0xFFF));
        mob:setLocalVar("wait", 0);
    elseif (ready > 0) then mob:addEnmity(GetMobByID(ready + bit.lshift(mob:getZoneID(), 12) + 0x1000000),0,1);
        -- Why is this even here?
    else
        mob:setLocalVar("wait", wait+3);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    mob:getBattlefield():lose();
end;
