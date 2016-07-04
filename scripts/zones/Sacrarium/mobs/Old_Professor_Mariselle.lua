-----------------------------------
-- Area: Sacrarium
--  MOB: Old Professor Mariselle
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)

    local OP_Mariselle = mob:getID();

   -- Summons a pupil every 30 seconds.
   -- TODO: Casting animation for summons. When he spawns them isn't retail accurate.
   -- TODO: Make him and the clones teleport around the room every 30s

    if (mob:getBattleTime() % 30 < 3 and mob:getBattleTime() > 3) then
        for i = OP_Mariselle+1, OP_Mariselle+2 do
            if (GetMobAction(i) == 0) then
                SpawnMob(i):updateEnmity(target);
                GetMobByID(i):setPos(GetMobByID(OP_Mariselle):getXPos()+1, GetMobByID(OP_Mariselle):getYPos(), GetMobByID(OP_Mariselle):getZPos()+1); -- Set pupil x and z position +1 from Mariselle
                return;
            end
        end
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local OP_Mariselle = mob:getID();

    for i = OP_Mariselle+1, OP_Mariselle+2 do
        if (GetMobAction(i) ~= 0) then
            DespawnMob(i);
        end
    end

    if (player:getCurrentMission(COP) == THE_SECRETS_OF_WORSHIP and player:getVar("PromathiaStatus") == 3 and  player:hasKeyItem(RELIQUIARIUM_KEY)==false) then
        player:setVar("PromathiaStatus",4);
    end

  -- Set random variable for determining Old Prof. Mariselle's next spawn location
    local rand = math.random((2),(7));
    SetServerVariable("Old_Prof_Spawn_Location", rand);

end;

-----------------------------------
-- OnMobDespawn
-----------------------------------
function onMobDespawn( mob )

    local OP_Mariselle = mob:getID();

    for i = OP_Mariselle+1, OP_Mariselle+2 do
        if (GetMobAction(i) ~= 0) then
            DespawnMob(i);
        end
    end

  -- Set random variable for determining Old Prof. Mariselle's next spawn location
    local rand = math.random((2),(7));
    SetServerVariable("Old_Prof_Spawn_Location", rand);

end;