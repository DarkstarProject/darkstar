-----------------------------------
--  PET: Wyvern
-----------------------------------
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    local master = mob:getMaster();
    master:addListener("WEAPONSKILL_USE", "PET_WYVERN_WS", function(player, skillid)
        print(player:getID());
    end);

    master:addListener("ATTACK", "PET_WYVERN_ENGAGE", function(player, target, action)
        if (mob:getTarget() == nil or target:getID() ~= mob:getTarget():getID()) then
            player:petAttack(target);
        end
    end);

    master:addListener("DISENGAGE", "PET_WYVERN_DISENGAGE", function(player)
        player:petRetreat();
    end);
    
end;

-----------------------------------
-- onMobDespawn Action
-----------------------------------

function onMobDeath(mob)
    local master = mob:getMaster();
    master:removeListener("PET_WYVERN_WS");
    master:removeListener("PET_WYVERN_ENGAGE");
    master:removeListener("PET_WYVERN_DISENGAGE");
end;
