-----------------------------------
-- Area: Behemoth's Dominion
--  MOB: Moxnix Nightgoggle
-- Involved in Quest: The Talekeeper's Gift
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)

    if (player:getQuestStatus(BASTOK,THE_TALEKEEPER_S_GIFT) == QUEST_ACCEPTED) then
        player:setVar("theTalekeepersGiftKilledNM",player:getVar("theTalekeepersGiftKilledNM") + 1);
    end

end;