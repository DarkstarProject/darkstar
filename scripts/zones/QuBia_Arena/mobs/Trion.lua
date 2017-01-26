-----------------------------------
-- Area: qubia arena
--  MOB: Trion
-- Ally during San d'Oria Mission 9-2
-----------------------------------
package.loaded["scripts/zones/QuBia_Arena/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/QuBia_Arena/TextIDs");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(MOD_REGAIN, 30);
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:addListener("WEAPONSKILL_STATE_ENTER", "WS_START_MSG", function(mob, skillID)
        -- Red Lotus Blade
        if (skillID == 968) then
            mob:showText(mob,RLB_PREPARE);
        -- Flat Blade
        elseif (skillID == 969) then
            mob:showText(mob,FLAT_PREPARE);
        -- Savage Blade
        elseif (skillID == 970) then
            mob:showText(mob,SAVAGE_PREPARE);
        end
    );
end;

-----------------------------------
-- onMobRoam Action
-----------------------------------

function onMobRoam(mob)
    local wait = mob:getLocalVar("wait");
    local ready = mob:getLocalVar("ready");
    if (ready == 0 and wait > 40) then
        local baseID = 17621014 + (mob:getBattlefield():getBattlefieldNumber() - 1) * 2;
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
