-----------------------------------
-- Area: Grand Palace of HuXzoi
--  MOB: Ix_aern_mnk
-- ID: 16916815
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    local QuestionMark = 16916819; -- The ??? that spawned this mob.
    local chance = GetNPCByID(QuestionMark):getLocalVar("[SEA]IxAern_DropRate"); -- Adjust drop rate for the items based on the organs traded to the ???.
    if (math.random(0,1) > 0) then     
        SetDropRate(4398,1851,chance*10); -- Deed Of Placidity
        SetDropRate(4398,1901,0);
    else
        SetDropRate(4398,1851,0);
        SetDropRate(4398,1901,chance*10); -- Vice of Antipathy
    end
    GetNPCByID(QuestionMark):setLocalVar("[SEA]IxAern_DropRate", 0); -- Clears the var from the ???.
    mob:AnimationSub(1); -- Reset the subanim - otherwise it will respawn with bracers on. Note that Aerns are never actually supposed to be in subanim 0.
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob,target)
    -- The mob gains a huge boost when it 2hours to attack speed and attack.
    -- It forces the minions to 2hour as well. Wiki says 50% but all videos show 60%.
    if (mob:getLocalVar("BracerMode") == 0) then
        if (mob:getHPP() < math.random(50,60)) then
            -- Go into bracer mode
            mob:setLocalVar("BracerMode",1);
            mob:AnimationSub(2); -- Puts on the bracers! He gonna fuck you up now.
            mob:addMod(MOD_ATT, 200);
            mob:addMod(MOD_HASTE_ABILITY, 150);
            mob:useMobAbility(3411); -- Hundred Fists
            
            -- Force minions to 2hour
            if (GetMobAction(mob:getID()+1) ~= 0) then
                GetMobByID(mob:getID()+1):useMobAbility(3412); -- Chainspell
            end
            if (GetMobAction(mob:getID()+2) ~= 0) then
                GetMobByID(mob:getID()+2):useMobAbility(3413); -- Benediction
            end
        end;
    end;
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    -- Despawn his minions if they are alive (Qn'aern)
    DespawnMob(mob:getID()+1);
    DespawnMob(mob:getID()+2);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    -- Despawn his minions if they are alive (Qn'aern)
    DespawnMob(mob:getID()+1);
    DespawnMob(mob:getID()+2);
    local QuestionMark = 16916819; -- The ??? that spawned this mob.
    QuestionMark:updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
