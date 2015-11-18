-----------------------------------
-- Area: Al'Taieu
-- NPC:  Ul'Hpemde
-----------------------------------

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:hideName(true);
    mob:untargetable(true);
    mob:AnimationSub(5);
    mob:SetAutoAttackEnabled(false);
    mob:SetMobAbilityEnabled(false);
    mob:setMod(MOD_REGEN, 10);
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob, killer)
    mob:hideName(false);
    mob:untargetable(false);
    if (mob:AnimationSub() == 5) then
        mob:AnimationSub(6);
    end
end;

-----------------------------------
-- onMobRoam Action
-----------------------------------

function onMobRoam(mob)    
    if (mob:getHPP() == 100) then 
        mob:setLocalVar("damaged", 0);
        mob:SetAutoAttackEnabled(false);
        mob:SetMobAbilityEnabled(false);
    end
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob, target)

    if (mob:getHP() < mob:getMaxHP()) then -- it will attack once it has been damaged.
        if (mob:getLocalVar("damaged") == 0) then
            mob:SetAutoAttackEnabled(true);
            mob:SetMobAbilityEnabled(true);
            mob:setLocalVar("damaged", 1);
        end
        
        local changeTime = mob:getLocalVar("changeTime");
        
        if (mob:AnimationSub() == 6 and mob:getBattleTime() - changeTime > 30) then
            mob:AnimationSub(3); -- Mouth Open
            mob:addMod(MOD_ATTP, 100);
            mob:addMod(MOD_DEFP, -50);
            mob:addMod(MOD_DMGMAGIC, -50);
            mob:setLocalVar("changeTime", mob:getBattleTime());
        
        elseif (mob:AnimationSub() == 3 and mob:getBattleTime() - changeTime > 30) then
            mob:AnimationSub(6); -- Mouth Closed
            mob:addMod(MOD_ATTP, -100);
            mob:addMod(MOD_DEFP, 50);
            mob:addMod(MOD_DMGMAGIC, 50);
            mob:setLocalVar("changeTime", mob:getBattleTime());
        end
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;