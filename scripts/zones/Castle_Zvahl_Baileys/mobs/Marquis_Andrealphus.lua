-----------------------------------
--  Area: Castle Zvahl Baileys
--  MOB: Marquis Andrealphus
--  Involved in Quests: Better The Demon You Know
--  !zone 161
-----------------------------------
package.loaded["scripts/zones/Castle_Zvahl_Baileys/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Castle_Zvahl_Baileys/TextIDs");
require("scripts/globals/status");
require("scripts/globals/quests");

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("bloodweapontrigger",math.random(30,60));
end;

-----------------------------------
-- OnMobRoam Action
-----------------------------------

function onMobRoam(mob)
    local enmity = mob:getEnmityList();
    if (#enmity == 0) then
        DespawnMob(mob:getID());
    end
end;

-----------------------------------
-- OnMobFight Action
-----------------------------------

function onMobFight(mob, target)
    local hpTrigger = mob:getLocalVar("bloodweapontrigger");
    local canEscape = false;
    local partyEnmity = mob:getEnmityList();
            if (#partyEnmity > 1) then
                canEscape = true;
            end
    if (mob:getHPP() <= hpTrigger and mob:getLocalVar("bloodweapon") == 0) then
        mob:useMobAbility(695);
        mob:setLocalVar("bloodweapon", 1);
    elseif (mob:getHPP() <= 66 and mob:getLocalVar("escape") == 0) then
        if (canEscape == true) then
            target:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_ESCAPE,0,4);
            mob:setLocalVar("escape", 1);
        end
    elseif (mob:getHPP() <= 33 and mob:getLocalVar("escape") == 1) then
        if (canEscape == true) then
            target:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_ESCAPE,0,4);
            mob:setLocalVar("escape", 2);
        end
    end
end;

-----------------------------------
-- OnMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:getQuestStatus(OTHER_AREAS,BETTER_THE_DEMON_YOU_KNOW) == QUEST_ACCEPTED) then
        player:setVar("MarquisAndrealphusKilled",1);
    end
    DespawnMob(17436967);
    DespawnMob(17436968);
    DespawnMob(17436969);
    DespawnMob(17436970);
end;

-----------------------------------
-- OnMobDespawn Action
-----------------------------------

function onMobDespawn (mob)
    DespawnMob(17436967);
    DespawnMob(17436968);
    DespawnMob(17436969);
    DespawnMob(17436970);
end;