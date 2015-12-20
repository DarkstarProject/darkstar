-----------------------------------
--  PET: Wyvern
-----------------------------------
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
  local master = mob:getMaster();
  master:addListener("WEAPONSKILL_USE", function(player, skillid)
    print(player:getID());
  end, "PET_WYVERN_WS");

    
end;

-----------------------------------
-- onMobDespawn Action
-----------------------------------

function onMobDeath(mob)
  local master = mob:getMaster();
  master:removeListener("PET_WYVERN_WS");
end;
