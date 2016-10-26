-----------------------------------
-- Area: Navukgo Execution Chamber
-- MOB: Karababa
-----------------------------------

package.loaded["scripts/zones/Navukgo_Execution_Chamber/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/Navukgo_Execution_Chamber/TextIDs");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
    local warp = mob:getLocalVar("warp");

    if (mob:getHPP() <= 50 and mob:getLocalVar("powerup") == 0) then
        target:showText(mob,KARABABA_ENOUGH);
        target:showText(mob,KARABABA_ROUGH);
        mob:addStatusEffect(EFFECT_MAGIC_ATK_BOOST,15,0,1800);
        mob:setLocalVar("powerup",1);
    elseif (mob:getHPP() <= 20 and warp == 0) then
        mob:setLocalVar("warp",1);
    end
end;

-----------------------------------
-- onSpellPrecast
-----------------------------------

function onSpellPrecast(mob, spell)
end;

-----------------------------------
-- onSpellPrecast
-----------------------------------

function onMonsterMagicPrepare(mob, target)
    local powerup = mob:getLocalVar("powerup");
    local rnd = math.random(1, 6)
    local warp = mob:getLocalVar("warp");

    if (warp == 1) then
        mob:showText(mob,KARABABA_QUIT);
        mob:setLocalVar("warp",2);
        return 261;
    elseif (mob:getLocalVar("warp") == 2) then
        mob:getBattlefield():lose();
        return -1;
    elseif (rnd == 1) then
        mob:showText(mob,KARABARA_FIRE);
        return 205 - powerup;
    elseif (rnd == 2) then
        mob:showText(mob,KARABARA_ICE);
        return 207 - powerup;
    elseif (rnd == 3) then
        mob:showText(mob,KARABARA_WIND);
        return 209 - powerup;
    elseif (rnd == 4) then
        mob:showText(mob,KARABARA_EARTH);
        return 211 - powerup;
    elseif (rnd == 5) then
        mob:showText(mob,KARABARA_LIGHTNING);
        return 213 - powerup;
    elseif (rnd == 6) then
        mob:showText(mob,KARABARA_WATER);
        return 215 - powerup;
    end

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob, player, isKiller)
    mob:getBattlefield():lose();
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    mob:getBattlefield():lose();
end;
