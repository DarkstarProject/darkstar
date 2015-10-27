-----------------------------------
-- Area: Al'Taieu
--  MOB: Qn'hpemde
-- Jailor of Love Pet version
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:AnimationSub(6); -- Mouth Closed
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob, target)        
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
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    local JoL = GetMobByID(16912848);
    local HPEMDES = JoL:getLocalVar("JoL_Qn_hpemde_Killed");
    JoL:setLocalVar("JoL_Qn_hpemde_Killed", HPEMDES+1);
end;