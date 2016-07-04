-----------------------------------
-- Area: Maze Of Shakhrami
--  MOB: Wyrmfly
-- Involved in Eco Warrior (Windurst)
-----------------------------------

require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:getQuestStatus(WINDURST,ECO_WARRIOR_WIN) ~= QUEST_AVAILABLE and player:getVar("ECO_WARRIOR_ACTIVE") == 238 and player:hasStatusEffect(EFFECT_LEVEL_RESTRICTION)) then
        player:setVar("ECOR_WAR_WIN-NMs_killed",1);
    end
end;