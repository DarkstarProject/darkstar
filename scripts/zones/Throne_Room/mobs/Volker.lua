-----------------------------------
-- Area: Throne Room
--  MOB: Volker
-- Ally during Bastok Mission 9-2
-----------------------------------
package.loaded["scripts/zones/Throne_Room/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Throne_Room/TextIDs");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:addListener("WEAPONSKILL_STATE_ENTER", "WS_START_MSG", function(mob, skillID)
        -- Red Lotus Blade
        if (skillID == 973) then
            mob:showText(mob,NO_HIDE_AWAY);
        -- Spirits Within
        elseif (skillID == 974) then
            mob:showText(mob,YOUR_ANSWER);
        -- Vorpal Blade
        elseif (skillID == 975) then
            mob:showText(mob,CANT_UNDERSTAND);
        end
    );
end;

-----------------------------------
-- onMobRoam
-----------------------------------

function onMobRoam(mob)
    local wait = mob:getLocalVar("wait");
    local ready = mob:getLocalVar("ready");
    if (ready == 0 and wait > 40) then
        local baseID = 17453064 + (mob:getBattlefield():getBattlefieldNumber() - 1) * 4;
        mob:setLocalVar("ready", bit.band(baseID, 0xFFF));
        mob:setLocalVar("wait", 0);
    elseif (ready > 0) then
        mob:addEnmity(GetMobByID(ready + bit.lshift(mob:getZoneID(), 12) + 0x1000000),0,1);
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
