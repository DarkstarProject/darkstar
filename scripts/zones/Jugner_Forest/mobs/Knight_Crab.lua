-----------------------------------
-- Area: Jugner Forest
--  MOB: Knight Crab
-----------------------------------
require("scripts/zones/Jugner_Forest/MobIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)

    --If respawn and variable is not 0, then it respawned before someone killed all 10 crabs
    local KingArthro = GetMobByID(KING_ARTHRO);

    if (KingArthro:getLocalVar("[POP]King_Arthro") > 0) then
        KingArthro:setLocalVar("[POP]King_Arthro", KingArthro:getLocalVar("[POP]King_Arthro")  - 1);
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    
    local KingArthro = GetMobByID(KING_ARTHRO);

    KingArthro:setLocalVar("[POP]King_Arthro", KingArthro:getLocalVar("[POP]King_Arthro") + 1);

    if (KingArthro:getLocalVar("[POP]King_Arthro") == 10) then
        KingArthro:setLocalVar("[POP]King_Arthro", 0);
        SpawnMob(KING_ARTHRO); -- Pop King Arthro !
    end

end;
