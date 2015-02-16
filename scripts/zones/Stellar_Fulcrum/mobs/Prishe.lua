-----------------------------------
-- Area: Stellar Falcrum
-- NPC: Prishe
-- v3
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");

function onMobInitialize(mob)
    mob:addMod(MOD_REGAIN, 50);
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)

end;

function onMobFight(mob, target)

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("updateCSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option,target)
--printf("finishCSID: %u",csid);
--printf("RESULT: %u",option);

end;