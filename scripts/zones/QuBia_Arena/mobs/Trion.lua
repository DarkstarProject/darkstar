-----------------------------------
-- Area: qubia arena
--  MOB: Trion
-- Ally during San d'Oria Mission 9-2
-----------------------------------
package.loaded["scripts/zones/QuBia_Arena/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/QuBia_Arena/TextIDs");
require("scripts/zones/QuBia_Arena/MobIDs");
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(MOD_REGAIN, 30);
end;

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
    end);
end;

function onMobDisengage(mob)
    mob:setLocalVar("wait", 0);
end;

function onMobRoam(mob)
    local wait = mob:getLocalVar("wait");
    if (wait > 40) then
        -- pick a random living target from the three enemies
        local inst = mob:getBattlefield():getBattlefieldNumber();
        local instOffset = HEIR_TO_THE_LIGHT_OFFSET + (14 * (inst-1));
        local target = GetMobByID(instOffset + math.random(0,2));
        if (not target:isDead()) then
            mob:addEnmity(target,0,1);
            mob:setLocalVar("wait", 0);
        end
    else
        mob:setLocalVar("wait", wait+3);
    end
end;

function onMobDeath(mob, player, isKiller)
    mob:getBattlefield():lose();
end;
