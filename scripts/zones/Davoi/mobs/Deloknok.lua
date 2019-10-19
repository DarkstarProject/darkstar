-----------------------------------
-- Area: Davoi
--  Mob: Deloknok
-- Involved in Quest: The First Meeting
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/quests");
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local theFirstMeeting = player:getQuestStatus(BASTOK,dsp.quest.id.bastok.THE_FIRST_MEETING);
    local martialArtsScroll = player:hasKeyItem(dsp.ki.SANDORIAN_MARTIAL_ARTS_SCROLL);

    if (theFirstMeeting == QUEST_ACCEPTED and martialArtsScroll == false) then
        player:addCharVar("theFirstMeetingKilledNM", 1)
    end

end;