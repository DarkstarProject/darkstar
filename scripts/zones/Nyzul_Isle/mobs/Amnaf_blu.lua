-----------------------------------
-- Area: Nyzul Isle (Path of Darkness)
--  MOB: Amnaf (BLU)
-----------------------------------
require("scripts/zones/Nyzul_Isle/IDs");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    local instance = mob:getInstance();

    -- Stage 2 Adjustments
    if (instance:getProgress() >= 10) then
        -- Don't let Amnaf wander back to the original spawn position
        mob:setMobMod(MOBMOD_NO_MOVE, 1);

        -- Stage 2 starts at 50%
        local hp = mob:getHP();
        mob:setHP(hp / 2);

        -- Stage 2 Position
        mob:setPos(499,0,-491,66);

        -- Stage 2 AI Flag
        mob:setLocalVar("SegmentChanged",1);
    end

    mob:setLocalVar("DespawnSignal",0);
    mob:setUnkillable(true);

    mob:addListener("WEAPONSKILL_STATE_ENTER", "WS_START_MSG", function(mob, skillID)
        -- Circle Blade
        if (skillID == 38) then
            mob:showText(mob,NyzulIsle.text.I_WILL_SINK_YOUR_CORPSES);
        end
    end);
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
    -- Relax movement lock
    mob:setMobMod(MOBMOD_NO_MOVE, 0);

    -- Stage AI flags
    local form = mob:getLocalVar("SegmentChanged");
    local form1Gears = mob:getLocalVar("Form1Gears");
    local form1Gears = mob:getLocalVar("Form2Gears");

    -- 4 gears spawn on Stage 1 of the Fight
    if (form1Gears == 0) then
        mob:showText(mob,NyzulIsle.text.FORMATION_GELINCIK);
        local instance = mob:getInstance();
        SpawnMob(NyzulIsle.mobs[58].IMPERIAL_GEAR1,instance):updateEnmity(target);
        SpawnMob(NyzulIsle.mobs[58].IMPERIAL_GEAR2,instance):updateEnmity(target);
        SpawnMob(NyzulIsle.mobs[58].IMPERIAL_GEAR3,instance):updateEnmity(target);
        SpawnMob(NyzulIsle.mobs[58].IMPERIAL_GEAR4,instance):updateEnmity(target);
        mob:setLocalVar("Form1Gears", 1);
    end

    -- 4 more gears spawn on Stage 2 of the Fight
    if (form == 1 and form2Gears == 0) then
        mob:showText(mob,NyzulIsle.text.SURRENDER);
        local gear = SpawnMob(NyzulIsle.mobs[58].IMPERIAL_GEAR1,instance)
        gear:updateEnmity(target);
        gear = SpawnMob(NyzulIsle.mobs[58].IMPERIAL_GEAR2,instance);
        gear:updateEnmity(target);
        gear = SpawnMob(NyzulIsle.mobs[58].IMPERIAL_GEAR3,instance);
        gear:updateEnmity(target);
        gear = SpawnMob(NyzulIsle.mobs[58].IMPERIAL_GEAR4,instance);
        gear:updateEnmity(target);
        gear:setLocalVar("Form2Gears", 1);
    end

end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
    local segment = mob:getLocalVar("SegmentChanged");
    if (mob:getHPP() <= 30 and mob:getLocalVar("RenameThisVar") == 0) then
        mob:showText(mob,NyzulIsle.text.CURSED_ESSENCES);
        -- Azure Lore (or Chain Affinity?) needs to happen here followed by ws+cast. https://youtu.be/7jsXnwkqMM4?t=4m4s
        mob:setLocalVar("RenameThisVar", 1)
    -- At 50% and 20% respectively, Amnaf disappears and the fight advances to the next stage
    elseif ((mob:getHPP() <= 50 and segment == 0) or (mob:getHPP() <= 20 and segment == 1)) then
        if (segment == 0) then -- It was less duplicate code to just check segment again.
            mob:showText(mob,NyzulIsle.text.UGH);
        elseif (segment == 1) then
            mob:showText(mob,NyzulIsle.text.CANNOT_WIN);
        end

        if (mob:getLocalVar("DespawnSignal") == 0) then
            mob:setLocalVar("DespawnSignal", 1);
            local instance = mob:getInstance();
            instance:setProgress(instance:getProgress() + 10);
        end
    end
end;

-----------------------------------
-- onSpellPrecast
-----------------------------------

function onSpellPrecast(mob, spell)
    -- Hysteric Barrage
    if (spell == 641) then
        mob:showText(mob,NyzulIsle.text.AWAKEN);
    -- Tail Slap
    elseif (spell == 640) then
        mob:showText(mob,NyzulIsle.text.MANIFEST);
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
    local instance = mob:getInstance();
    instance:setProgress(instance:getProgress() + 10);
end;
