-----------------------------------
-- Area: La Theine Plateau
--  MOB: Tumbling Truffle
-----------------------------------

require("scripts/zones/La_Theine_Plateau/MobIDs");
require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,71,2);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    SetServerVariable("[POP]Tumbling_Truffle", os.time() + math.random(3600,28800)); -- 1-8 hours
    DisallowRespawn(mob:getID(), true);

    local PH = GetServerVariable("[PH]Tumbling_Truffle");
    SetServerVariable("[PH]Tumbling_Truffle", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
end;

