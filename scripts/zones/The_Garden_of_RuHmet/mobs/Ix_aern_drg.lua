-----------------------------------
-- Area: The Garden of Ru'Hmet
--  MOB: Ix'aern (drg)
-----------------------------------
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    if (math.random(0,99) < 78) then
        SetDropRate(4396,1870,1000); -- Deed Of Sensib.
        SetDropRate(4396,1903,0);
    else
        SetDropRate(4396,1870,0);
        SetDropRate(4396,1903,1000); -- Vice Of Aspersion
    end
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
    -- Spawn the pets if they are despawned
    -- TODO: summon animations?
    for wynavs = mob:getID()+1, mob:getID()+3 do
        if (GetMobAction(wynavs) == ACTION_NONE) then
            local repopWynavs = GetMobByID(wynavs):getLocalVar("repop"); -- see Wynav script
            if (mob:getBattleTime() - repopWynavs > 10) then
                GetMobByID(wynavs):setSpawn(
                    mob:getXPos()+math.random(1,5),
                    mob:getYPos(),
                    mob:getZPos()+math.random(1,5)
                ); -- Line got too wide.
                SpawnMob(wynavs):updateEnmity(target);
            end
        end
    end
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    -- Despawn pets..
    DespawnMob(mob:getID()+1);
    DespawnMob(mob:getID()+2);
    DespawnMob(mob:getID()+3);
end;

-----------------------------------
-- OnMobDespawn
-----------------------------------
function onMobDespawn( mob )
    -- Despawn pets.
    DespawnMob(mob:getID()+1);
    DespawnMob(mob:getID()+2);
    DespawnMob(mob:getID()+3);

    -- Pick a new PH for Ix'Aern (DRG)
    SetServerVariable("[SEA]IxAernDRG_PH", AwAernDRGGroups[math.random(1, #AwAernDRGGroups)] + math.random(0, 2));
end
