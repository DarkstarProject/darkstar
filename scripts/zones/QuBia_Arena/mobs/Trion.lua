-----------------------------------
-- Area: qubia arena
-- NPC:  Trion
-- the heir to the light sando 9-2
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/zones/QuBia_Arena/TextIDs");

function onMobInitialize(mob)
    mob:addMod(MOD_REGAIN, 30);
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)

end;

function onMobEngaged(mob, target)
   end;

function onMobFight(mob, target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
mob:getBattlefield():lose();
end;

function onMobRoam(mob)
    local wait = mob:getLocalVar("wait");
    local ready = mob:getLocalVar("ready");
if (ready == 0 and wait > 40) then local baseID = 17621014 + (mob:getBattlefield():getBattlefieldNumber() - 1) * 2
mob:setLocalVar("ready", bit.band(baseID, 0xFFF));
mob:setLocalVar("wait", 0);
elseif (ready > 0) then mob:addEnmity(GetMobByID(ready + bit.lshift(mob:getZoneID(), 12) + 0x1000000),0,1);
else
mob:setLocalVar("wait", wait+3);
end
end;
            
