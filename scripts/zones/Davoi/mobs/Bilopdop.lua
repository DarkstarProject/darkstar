-----------------------------------
-- Area: Davoi
--  MOB: Bilopdop
-- Involved in Quest: The First Meeting
-----------------------------------

require("scripts/globals/keyitems");
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
    local theFirstMeeting = ally:getQuestStatus(BASTOK,THE_FIRST_MEETING);
    local martialArtsScroll = ally:hasKeyItem(SANDORIAN_MARTIAL_ARTS_SCROLL);

    if (theFirstMeeting == QUEST_ACCEPTED and martialArtsScroll == false) then
        ally:setVar("theFirstMeetingKilledNM",ally:getVar("theFirstMeetingKilledNM") + 1);
    end
end;