-----------------------------------
-- Area: Behemoth's Dominion
--  MOB: Picklix Longindex
-- Involved in Quest: The Talekeeper's Gift
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

function onMobDeath(mob, killer, ally)

    if (ally:getQuestStatus(BASTOK,THE_TALEKEEPER_S_GIFT) == QUEST_ACCEPTED) then
        ally:setVar("theTalekeepersGiftKilledNM",ally:getVar("theTalekeepersGiftKilledNM") + 1);
    end

end;